import 'package:coffee_app_ui/pages/home_page.dart';
import 'package:flutter/material.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  // Sales data with correct 'id', 'items', 'date', 'time', and 'total'
  final List<Map<String, dynamic>> sales = const [
    {
      'id': 'S001', // Sale ID
      'items': [
        {'name': 'Latte', 'price': 3.50, 'amount': 2}, // 2 Lattes
        {'name': 'Espresso', 'price': 2.00, 'amount': 1}, // 1 Espresso
      ],
      'date': '2024-10-08',
      'time': '10:30 AM',
      'total': 9.00 // Total calculated as (3.50*2 + 2.00*1)
    },
    {
      'id': 'S002', // Sale ID
      'items': [
        {'name': 'Cappuccino', 'price': 4.00, 'amount': 1}, // 1 Cappuccino
        {'name': 'Mocha', 'price': 3.75, 'amount': 1}, // 1 Mocha
      ],
      'date': '2024-10-08',
      'time': '11:00 AM',
      'total': 7.75 // Total calculated as (4.00*1 + 3.75*1)
    },
    {
      'id': 'S003', // Sale ID
      'items': [
        {'name': 'Americano', 'price': 2.50, 'amount': 1}, // 1 Americano
        {'name': 'Latte', 'price': 3.50, 'amount': 1}, // 1 Latte
      ],
      'date': '2024-10-07',
      'time': '09:45 AM',
      'total': 6.00 // Total calculated as (2.50*1 + 3.50*1)
    },
    {
      'id': 'S004', // Sale ID
      'items': [
        {'name': 'Macchiato', 'price': 3.00, 'amount': 3}, // 3 Macchiatos
      ],
      'date': '2024-10-07',
      'time': '02:15 PM',
      'total': 9.00 // Total calculated as (3.00*3)
    },
    {
      'id': 'S005', // Sale ID
      'items': [
        {'name': 'Flat White', 'price': 4.50, 'amount': 2}, // 2 Flat Whites
        {'name': 'Croissant', 'price': 2.25, 'amount': 1}, // 1 Croissant
      ],
      'date': '2024-10-06',
      'time': '08:30 AM',
      'total': 11.25 // Total calculated as (4.50*2 + 2.25*1)
    },
    {
      'id': 'S006', // Sale ID
      'items': [
        {'name': 'Iced Coffee', 'price': 5.00, 'amount': 1}, // 1 Iced Coffee
        {'name': 'Muffin', 'price': 2.50, 'amount': 2}, // 2 Muffins
      ],
      'date': '2024-10-06',
      'time': '10:00 AM',
      'total': 10.00 // Total calculated as (5.00*1 + 2.50*2)
    },
    {
      'id': 'S007', // Sale ID
      'items': [
        {'name': 'Tea', 'price': 2.00, 'amount': 4}, // 4 Teas
      ],
      'date': '2024-10-05',
      'time': '12:30 PM',
      'total': 8.00 // Total calculated as (2.00*4)
    },
    {
      'id': 'S008', // Sale ID
      'items': [
        {'name': 'Frappuccino', 'price': 5.50, 'amount': 2}, // 2 Frappuccinos
      ],
      'date': '2024-10-05',
      'time': '03:45 PM',
      'total': 11.00 // Total calculated as (5.50*2)
    },
    {
      'id': 'S009', // Sale ID
      'items': [
        {
          'name': 'Nitro Cold Brew',
          'price': 4.75,
          'amount': 1
        }, // 1 Nitro Cold Brew
        {'name': 'Danish', 'price': 2.50, 'amount': 1}, // 1 Danish
      ],
      'date': '2024-10-04',
      'time': '09:00 AM',
      'total': 7.25 // Total calculated as (4.75*1 + 2.50*1)
    },
    {
      'id': 'S010', // Sale ID
      'items': [
        {
          'name': 'Turmeric Latte',
          'price': 3.00,
          'amount': 2
        }, // 2 Turmeric Lattes
        {'name': 'Scone', 'price': 2.00, 'amount': 1}, // 1 Scone
      ],
      'date': '2024-10-04',
      'time': '11:30 AM',
      'total': 8.00 // Total calculated as (3.00*2 + 2.00*1)
    },
    {
      'id': 'S011', // Sale ID
      'items': [
        {
          'name': 'Hot Chocolate',
          'price': 4.00,
          'amount': 1
        }, // 1 Hot Chocolate
        {'name': 'Brownie', 'price': 3.00, 'amount': 1}, // 1 Brownie
      ],
      'date': '2024-10-03',
      'time': '03:00 PM',
      'total': 7.00 // Total calculated as (4.00*1 + 3.00*1)
    },
    {
      'id': 'S012', // Sale ID
      'items': [
        {
          'name': 'Vanilla Latte',
          'price': 4.50,
          'amount': 1
        }, // 1 Vanilla Latte
      ],
      'date': '2024-10-02',
      'time': '10:15 AM',
      'total': 4.50 // Total calculated as (4.50*1)
    },
    {
      'id': 'S013', // Sale ID
      'items': [
        {'name': 'Chai Latte', 'price': 3.50, 'amount': 3}, // 3 Chai Lattes
      ],
      'date': '2024-10-01',
      'time': '01:00 PM',
      'total': 10.50 // Total calculated as (3.50*3)
    },
    {
      'id': 'S014', // Sale ID
      'items': [
        {
          'name': 'Peach Iced Tea',
          'price': 2.75,
          'amount': 2
        }, // 2 Peach Iced Teas
      ],
      'date': '2024-10-01',
      'time': '05:00 PM',
      'total': 5.50 // Total calculated as (2.75*2)
    },
    {
      'id': 'S015', // Sale ID
      'items': [
        {'name': 'Lemonade', 'price': 3.00, 'amount': 1}, // 1 Lemonade
        {'name': 'Cookies', 'price': 1.50, 'amount': 3}, // 3 Cookies
      ],
      'date': '2024-09-30',
      'time': '12:00 PM',
      'total': 8.50 // Total calculated as (3.00*1 + 1.50*3)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Overview'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: sales.length,
                itemBuilder: (context, index) {
                  final sale = sales[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.receipt),
                      title: Text('Sale ID: ${sale['id']}'),
                      subtitle: Text(
                        'Date: ${sale['date']} \nTime: ${sale['time']} \nTotal: \$${sale['total']?.toStringAsFixed(2) ?? 'N/A'}',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SaleDetailPage(sale: sale),
                          ),
                        );
                      },
                    ),
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

class SaleDetailPage extends StatelessWidget {
  final Map<String, dynamic> sale;

  const SaleDetailPage({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sale Details for ID: ${sale['id']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Date: ${sale['date']}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Time: ${sale['time']}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Items:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Display each item with name, amount, and calculated total
            ...sale['items']?.map<Widget>((item) {
                  final amount =
                      item['amount'] ?? 1; // Default amount to 1 if null
                  final price =
                      item['price'] ?? 0.0; // Default price to 0.0 if null
                  return ListTile(
                    title: Text('$amount x ${item['name']}'),
                    trailing: Text('\$${(price * amount).toStringAsFixed(2)}'),
                  );
                })?.toList() ??
                [], // Handle null safety
            const SizedBox(height: 20),
            // Show total price in a decorative box
            Center(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Total: \$${sale['total']?.toStringAsFixed(2) ?? 'N/A'}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
