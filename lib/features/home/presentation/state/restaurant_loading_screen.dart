import 'package:flutter/material.dart';

class RestaurantLoadingScreen extends StatelessWidget {
  const RestaurantLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
