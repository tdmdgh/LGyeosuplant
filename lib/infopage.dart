import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  final List<String> infoData;
  final bool shAB;
  const InfoScreen({Key? key, required this.infoData, required this.shAB})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.shAB
            ? AppBar(
                title: Text(widget.infoData[0]),
              )
            : null,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(children: [
                  RichText(
                    text: TextSpan(
                        text: '이름: ',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        )),
                  ),
                  RichText(
                    text: TextSpan(
                        text: widget.infoData[0],
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ]),
                SizedBox(height: 10),
                Row(children: [
                  RichText(
                    text: TextSpan(
                        text: '위치: ',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        )),
                  ),
                  RichText(
                    text: TextSpan(
                        text: widget.infoData[1],
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ]),
                SizedBox(height: 20),
                Image(image: AssetImage(widget.infoData[2])),
                SizedBox(height: 10),
              ],
            ),
          ),
        )
        // Center(
        //     child: Column(
        //   children: [
        //     Text(widget.infoData[0]),
        //     Text(widget.infoData[1]),
        //     Image(image: AssetImage(widget.infoData[2])),
        //   ],
        // )),
        );
  }
}
