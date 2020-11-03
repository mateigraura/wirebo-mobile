import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              accountName: Text('User me'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/default-avatar.jpg'),
              ),
              accountEmail: Text('')),
          DrawerListTile(
            icon: Icons.lock,
            title: 'New  Secret  Chat',
            onTilePressed: () {},
          ),
          DrawerListTile(
            icon: Icons.contacts,
            title: 'Contacts',
            onTilePressed: () {},
          ),
          DrawerListTile(
            icon: Icons.settings,
            title: 'Settings',
            onTilePressed: () {},
          ),
          Divider(),
          DrawerListTile(
            icon: Icons.person_add,
            title: 'Invite Friends',
            onTilePressed: () {},
          )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final VoidCallback onTilePressed;
  final IconData icon;
  final String title;

  const DrawerListTile({Key key, this.icon, this.title, this.onTilePressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
