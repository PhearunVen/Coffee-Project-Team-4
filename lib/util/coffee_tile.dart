import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  const CoffeeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        width: 200,
        color: Colors.grey,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
