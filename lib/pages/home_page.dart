import 'package:coffee_app_ui/data/coffee_item.dart';
import 'package:coffee_app_ui/pages/drawer_page.dart';
import 'package:coffee_app_ui/pages/myfooter.dart';
import 'package:coffee_app_ui/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<CoffeeItem> coffeeItems = [
    CoffeeItem(
        imagePath: 'assets/images/latte.png', name: 'Latte', price: 3.00),
    CoffeeItem(
        imagePath: 'assets/images/cappuiccino.png',
        name: 'Cappuccino',
        price: 3.50),
    CoffeeItem(
        imagePath: 'assets/images/espresso.png', name: 'Espresso', price: 2.50),
    CoffeeItem(
        imagePath: 'assets/images/americano.png',
        name: 'Americano',
        price: 2.00),
    CoffeeItem(
        imagePath: 'assets/images/mocha.png', name: 'Mocha', price: 4.00),
    CoffeeItem(
        imagePath: 'assets/images/macchiato.png',
        name: 'Macchiato',
        price: 3.75),
  ];

  final List<Map<String, dynamic>> orderList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addToOrder(CoffeeItem item) {
    setState(() {
      int index = orderList.indexWhere((order) => order['name'] == item.name);
      if (index == -1) {
        orderList.add({'name': item.name, 'price': item.price, 'amount': 1});
      } else {
        orderList[index]['amount']++;
      }
    });
  }

  void _removeFromOrder(String name) {
    setState(() {
      int index = orderList.indexWhere((order) => order['name'] == name);
      if (index != -1) {
        if (orderList[index]['amount'] > 1) {
          orderList[index]['amount']--;
        } else {
          orderList.removeAt(index);
        }
      }
    });
  }

  void _incrementOrder(String name) {
    setState(() {
      int index = orderList.indexWhere((order) => order['name'] == name);
      if (index != -1) {
        orderList[index]['amount']++;
      }
    });
  }

  void _decrementOrder(String name) {
    setState(() {
      int index = orderList.indexWhere((order) => order['name'] == name);
      if (index != -1) {
        if (orderList[index]['amount'] > 1) {
          orderList[index]['amount']--;
        } else {
          orderList.removeAt(index);
        }
      }
    });
  }

  double get totalPrice {
    return orderList.fold(
        0, (sum, order) => sum + (order['price'] * order['amount']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      drawer: const DrawerPage(),
      bottomNavigationBar: MyFooter(
        orderList: orderList,
        totalPrice: totalPrice,
        onRemove: _removeFromOrder,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Find the best Coffee😍 for you😘😘',
              style: GoogleFonts.bebasNeue(fontSize: 40),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Find your Coffee....',
                focusedBorder: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              isScrollable: true,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 3, color: Colors.orange),
              ),
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              tabs: const [
                Tab(text: "Hot Coffee"),
                Tab(text: "Cold Coffee"),
                Tab(text: "Cappuccino"),
                Tab(text: "Late Coffee"),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: (150 / 195),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(coffeeItems.length, (index) {
                final coffee = coffeeItems[index];
                return GestureDetector(
                  onTap: () => _addToOrder(coffee),
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            coffee.imagePath,
                            width: 120,
                            height: 120,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            coffee.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 5, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$ ${coffee.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.add, color: Colors.orange),
                                onPressed: () => _addToOrder(coffee),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
