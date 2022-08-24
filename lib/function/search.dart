import 'package:flutter/material.dart';
import 'package:lg_plant/infopage.dart';

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  List<String> selectedResult = [];

  @override
  Widget buildResults(BuildContext context) {
    return InfoScreen(
      infoData: selectedResult,
      shAB: false,
    );
  }

  final List<List<String>> searchlist;
  // List<String> listExample = [];
  Search(this.searchlist) {
    // int total = searchlist.length;
    // listExample = List.generate(total, (index) => this.searchlist[index][0]);
  }

  // List<String> recentList = [];
  List<List<String>> recentList = [];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<List<String>> suggestionList = [];
    print(query);
    query.isEmpty
        ? suggestionList = recentList //In the true case

        : suggestionList.addAll(searchlist.where((element) {
            String tmpE = element[0].toUpperCase();
            String tmpQ = query.toUpperCase();
            return tmpE.contains(tmpQ);
          }));

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index][0],
          ),
          subtitle: Text(
            suggestionList[index][1],
          ),
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: AssetImage(suggestionList[index][2]),
                    fit: BoxFit.fitHeight)),
          ),
          onTap: () {
            selectedResult = suggestionList[index];

            showResults(context);
          },
        );
      },
    );
  }
}
