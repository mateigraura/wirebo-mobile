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
                color: Theme.of(context).primaryColor,
              ),
              accountName: Text(
                'User me',
                style: TextStyle(fontSize: 16),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/default-avatar.png'),
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
          Divider(
              color: Colors.black,
              thickness: 0.5,
              endIndent: 0,
              height: 10,
              indent: 60),
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
      leading: Icon(
        icon,
        color: Color(0xFF737F8B),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xFFE9EEF4)),
      ),
    );
  }
}
