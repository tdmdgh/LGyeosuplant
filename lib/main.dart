import 'package:flutter/material.dart';
import 'package:lg_plant/infopage.dart';
import 'package:lg_plant/function/search.dart';

import 'dataStore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '배관 배치도',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.pink[900]),
        primaryColor: Colors.pink[900],
      ),
      home: MyHomePage(title: 'LG 여수 공장 배관 배치도'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final List<List<String>> list = pList;
  // List.generate(50, (index) => "Texto $index");

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: Search(widget.list));
                })
          ],
        ),
        body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: widget.list.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(widget.list[index][0]),
                  subtitle: Text(
                    widget.list[index][1],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => InfoScreen(
                                  infoData: widget.list[index],
                                  shAB: true,
                                )));
                  },
                )));
  }
}
