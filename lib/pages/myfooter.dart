import 'package:coffee_app_ui/pages/order_page.dart';
import 'package:coffee_app_ui/pages/home_page.dart';
import 'package:coffee_app_ui/pages/sale_page.dart';
import 'package:coffee_app_ui/pages/setting_page.dart';
import 'package:flutter/material.dart';

class MyFooter extends StatefulWidget {
  final List<Map<String, dynamic>> orderList;
  final double totalPrice;
  final Function(String) onRemove;

  const MyFooter({
    super.key,
    required this.orderList,
    required this.totalPrice,
    required this.onRemove,
  });

  @override
  State<MyFooter> createState() => _MyFooterState();
}

class _MyFooterState extends State<MyFooter> {
  int _selectedIndex = 0;

  void _onItemTapped(int index, Widget page) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: IconTheme(
        data: const IconThemeData(color: Colors.grey),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                size: 30,
                color: _selectedIndex == 0 ? Colors.orange : Colors.grey,
              ),
              onPressed: () {
                _onItemTapped(0, const HomePage());
              },
            ),
            IconButton(
              icon: Icon(
                Icons.book,
                size: 30,
                color: _selectedIndex == 1 ? Colors.orange : Colors.grey,
              ),
              onPressed: () {
                _onItemTapped(
                  1,
                  OrderPage(
                    orderList: widget.orderList,
                    totalPrice: widget.totalPrice,
                    onRemove: widget.onRemove,
                    // Include increment and decrement functions if needed
                    onIncrement: (name) {}, // placeholder
                    onDecrement: (name) {}, // placeholder
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.money_off,
                size: 30,
                color: _selectedIndex == 2 ? Colors.orange : Colors.grey,
              ),
              onPressed: () {
                _onItemTapped(2, const SalePage());
              },
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                size: 30,
                color: _selectedIndex == 3 ? Colors.orange : Colors.grey,
              ),
              onPressed: () {
                _onItemTapped(3, const SettingPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
