import 'package:flutter/material.dart';
import 'package:database_app/widgets/switch.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage("assets/images/logo.png"),
                  width: 80,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Faisal Aslam",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "faisalaslam218@gmail.com",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const ListTile(
            tileColor: Colors.white,
            title: Text(
              "Dark Mode",
              style: TextStyle(fontSize: 13),
            ),
            trailing: DrawerSwitch(),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(Icons.home),
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 13),
            ),
          ),
          const Divider(
            height: 10,
            color: Colors.blue,
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(Icons.call),
            title: const Text(
              "Contact",
              style: TextStyle(fontSize: 13),
            ),
          ),
          const Divider(
            height: 10,
            color: Colors.blue,
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(Icons.stars),
            title: const Text(
              "Rate us",
              style: TextStyle(fontSize: 13),
            ),
          ),
          const Divider(
            height: 10,
            color: Colors.blue,
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(Icons.support),
            title: const Text(
              "Support",
              style: TextStyle(fontSize: 13),
            ),
          ),
          const Divider(
            height: 10,
            color: Colors.blue,
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(Icons.settings),
            title: const Text(
              "Setting",
              style: TextStyle(fontSize: 13),
            ),
          ),
          const Divider(
            height: 10,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
