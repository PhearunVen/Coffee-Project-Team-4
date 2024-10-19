import 'package:coffee_app_ui/pages/home_page.dart';
import 'package:coffee_app_ui/pages/login_page.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _notificationsEnabled = true; // Control notifications switch
  bool _darkModeEnabled = false; // Control dark mode switch

  // Helper function to toggle dark mode
  void _toggleDarkMode(bool value) {
    setState(() {
      _darkModeEnabled = value;
      if (_darkModeEnabled) {
        // Switch to dark theme
        Theme.of(context).copyWith(
          brightness: Brightness.dark,
        );
      } else {
        // Switch to light theme
        Theme.of(context).copyWith(
          brightness: Brightness.light,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            ); // Replaces OrderPage with HomePage
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          // Notification settings tile
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Enable Notifications'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ),
          // Dark mode toggle tile
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Enable Dark Mode'),
            trailing: Switch(
              value: _darkModeEnabled,
              onChanged: (bool value) {
                _toggleDarkMode(value);
              },
            ),
          ),
          // About tile
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Coffee App',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.local_cafe),
                children: <Widget>[
                  const Text('This is a simple coffee ordering app.'),
                ],
              );
            },
          ),
          // Logout tile
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
