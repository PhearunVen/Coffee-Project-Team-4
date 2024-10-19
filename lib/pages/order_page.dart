import 'package:flutter/material.dart';
import 'package:coffee_app_ui/pages/home_page.dart'; // Ensure you import HomePage

class OrderPage extends StatelessWidget {
  final List<Map<String, dynamic>> orderList;
  final double totalPrice;
  final Function(String) onRemove;
  final Function(String) onIncrement;
  final Function(String) onDecrement;

  const OrderPage({
    super.key,
    required this.orderList,
    required this.totalPrice,
    required this.onRemove,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Order"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            ); // Go back to HomePage without replacing it
          },
        ),
      ),
      body: orderList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart, size: 50, color: Colors.grey),
                  const SizedBox(height: 20),
                  const Text(
                    'No items in your order',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Go to Home Page',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            )
          : ListView(
              children: [
                ...orderList.map((order) {
                  return ListTile(
                    title: Text(order['name']),
                    subtitle: Text('Amount: ${order['amount']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, color: Colors.red),
                          onPressed: () => onDecrement(order['name']),
                        ),
                        Text('${order['amount']}'),
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.green),
                          onPressed: () => onIncrement(order['name']),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.grey),
                          onPressed: () => onRemove(order['name']),
                        ),
                      ],
                    ),
                  );
                }),
                const Divider(),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 76, 75, 74),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(
                    'Total: \$${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Add some space before the button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to HomePage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Text('Pay Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.orange, // Set the background color to orange
                      foregroundColor:
                          Colors.white, // Set the text color to white
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
