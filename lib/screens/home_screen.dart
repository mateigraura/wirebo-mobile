import 'package:flutter/material.dart';
import 'package:wirebo/screens/menu_screen.dart';
import 'package:wirebo/widgets/favorite_contacts.dart';
import 'package:wirebo/widgets/chat_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Wirebo',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 25.0,
            color: Colors.white,
            onPressed: () {
              showSearch(context: context, delegate: Search());
            },
          ),
        ],
      ),
      drawer: MenuScreen(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  ChatList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Search extends SearchDelegate<String> {
  final contacts = ["User 1", "User 2"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, idx) => ListTile(
          leading: Icon(Icons.location_city), title: Text(contacts[idx])),
      itemCount: contacts.length,
    );
  }
}
