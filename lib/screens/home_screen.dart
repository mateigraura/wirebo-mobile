import 'package:flutter/material.dart';
import 'package:wirebo/models/message.dart';
import 'package:wirebo/services/message_service.dart';
import 'package:wirebo/screens/menu_screen.dart';
import 'package:wirebo/screens/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Wirebo',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
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
      body: ListView.separated(
          itemBuilder: (ctx, index) {
            final Message chat = chats[index];
            return ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(
                    user: chat.user,
                  ),
                ),
              ),
              leading: CircleAvatar(
                radius: 28,
                backgroundImage:
                    AssetImage("./assets/images/default-avatar.png"),
              ),
              title: Text(
                chat.user.name,
                style: TextStyle(
                  color: Color(0xFFE9EEF4),
                  fontSize: 15,
                ),
              ),
              subtitle: Text(chat.text,
                  style: TextStyle(fontSize: 13, color: Color(0xFF737F8B)),
                  overflow: TextOverflow.ellipsis),
              trailing: Text("21:04",
                  style: TextStyle(fontSize: 12, color: Color(0xFF737F8B))),
            );
          },
          separatorBuilder: (ctx, i) {
            return Divider(
              color: Colors.black,
              thickness: 0.5,
              endIndent: 0,
              height: 10,
              indent: 80,
            );
          },
          itemCount: chats.length),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.create,
            color: Colors.white,
          ),
          backgroundColor: Color(0xFF65a9e0),
          onPressed: () {}),
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
