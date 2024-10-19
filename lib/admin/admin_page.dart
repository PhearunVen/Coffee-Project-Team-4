import 'package:coffee_app_ui/admin/manage_menu_page.dart';
import 'package:coffee_app_ui/admin/manage_orders_page.dart';
import 'package:coffee_app_ui/admin/manage_staff_page.dart';
import 'package:coffee_app_ui/admin/reports_page.dart';
import 'package:coffee_app_ui/pages/login_page.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the metrics
    double totalRevenue = 15000.00; // Replace with your calculation
    double averageOrderValue = 250.00; // Replace with your calculation
    //int totalOrders = 60; // Replace with your count
    Map<String, int> staffPerformance = {
      'John Doe': 25,
      'Jane Smith': 20,
      'Tom Clark': 15,
    };
    Map<String, int> mostPopularItems = {
      'Espresso': 30,
      'Cappuccino': 25,
      'Latte': 20,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Shop Admin Dashboard'),
        backgroundColor: Colors.brown, // App bar color
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.brown),
              accountName: Text(
                'Admin',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              accountEmail: Text(
                'admin@gmail.com',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'A',
                  style: TextStyle(fontSize: 40.0, color: Colors.brown),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard, color: Colors.brown),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.coffee, color: Colors.brown),
              title: const Text('Manage Menu'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ManageMenuPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.receipt, color: Colors.brown),
              title: const Text('Manage Orders'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ManageOrdersPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.people, color: Colors.brown),
              title: const Text('Manage Staff'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ManageStaffPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.analytics, color: Colors.brown),
              title: const Text('Reports'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.brown),
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the body
        child: ListView(
          children: [
            const SizedBox(height: 10),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  DashboardCard(
                      title: 'Total Sales',
                      count: 500,
                      icon: Icons.monetization_on),
                  DashboardCard(
                      title: 'Active Orders',
                      count: 12,
                      icon: Icons.receipt_long),
                  DashboardCard(
                      title: 'Customers', count: 300, icon: Icons.people),
                  DashboardCard(
                      title: 'Menu Items', count: 45, icon: Icons.coffee),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  DashboardCard(
                      title: 'Total Revenue',
                      count: totalRevenue.toInt(),
                      icon: Icons.attach_money),
                  DashboardCard(
                      title: 'Avg Order Value',
                      count: averageOrderValue.toInt(),
                      icon: Icons.paid),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Staff Performance Metrics',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            ...staffPerformance.entries.map((entry) {
              return ListTile(
                title: Text(entry.key),
                trailing: Text('Orders: ${entry.value}'),
              );
            }),
            const SizedBox(height: 20),
            const Text(
              'Most Popular Items',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            ...mostPopularItems.entries.map((entry) {
              return ListTile(
                title: Text(entry.key),
                trailing: Text('Sold: ${entry.value}'),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;

  const DashboardCard(
      {super.key,
      required this.title,
      required this.count,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6, // Increase elevation for a more pronounced shadow
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 32, color: Colors.brown), // Icon color
                const SizedBox(width: 10),
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            Text(count.toString(),
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown)),
          ],
        ),
      ),
    );
  }
}
