import 'package:flutter/material.dart';

class RestaurantEmptyScreen extends StatelessWidget {
  const RestaurantEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("No restaurants found! Please try again later."),
    );
  }
}
