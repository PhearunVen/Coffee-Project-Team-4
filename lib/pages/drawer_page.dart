import 'package:coffee_app_ui/pages/home_page.dart';
import 'package:coffee_app_ui/pages/login_page.dart';
import 'package:coffee_app_ui/pages/setting_page.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // ignore: prefer_const_constructors
          UserAccountsDrawerHeader(
            accountName: const Text('John Doe'),
            accountEmail: const Text('johndoe@example.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/profile.png', // Replace with actual image
              ),
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFEA9008),
            ),
            // Using Column to display the role
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              // Show about dialog
              showAboutDialog(
                context: context,
                applicationName: 'Coffee App',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.local_cafe),
                children: const <Widget>[
                  Text('This is a simple coffee ordering app.'),
                ],
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Add your logout logic here
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out')),
              );
            },
          ),
        ],
      ),
    );
  }
}
