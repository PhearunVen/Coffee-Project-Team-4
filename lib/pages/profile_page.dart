import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for purchase history
    final List<Map<String, String>> purchaseHistory = [
      {'item': 'Cappuccino', 'date': '2024-10-01', 'price': '\$4.00'},
      {'item': 'Latte', 'date': '2024-09-29', 'price': '\$3.50'},
      {'item': 'Espresso', 'date': '2024-09-27', 'price': '\$2.50'},
      {'item': 'Mocha', 'date': '2024-09-25', 'price': '\$5.00'},
      {'item': 'Americano', 'date': '2024-09-22', 'price': '\$3.00'},
      {'item': 'Macchiato', 'date': '2024-09-20', 'price': '\$4.50'},
      {'item': 'Flat White', 'date': '2024-09-18', 'price': '\$3.80'},
      {'item': 'Iced Coffee', 'date': '2024-09-15', 'price': '\$4.20'},
      {'item': 'Frappuccino', 'date': '2024-09-12', 'price': '\$6.00'},
      {'item': 'Affogato', 'date': '2024-09-10', 'price': '\$4.80'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.avif'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Name: John Doe',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              'Email: john.doe@example.com',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            const Text(
              'Purchase History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Expanded widget to allow ListView to take the remaining space
            Expanded(
              child: ListView.builder(
                itemCount: purchaseHistory.length,
                itemBuilder: (context, index) {
                  final purchase = purchaseHistory[index];
                  return ListTile(
                    leading: const Icon(Icons.local_cafe, color: Colors.brown),
                    title: Text(purchase['item'] ?? ''),
                    subtitle: Text('Date: ${purchase['date']}'),
                    trailing: Text(purchase['price'] ?? ''),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
