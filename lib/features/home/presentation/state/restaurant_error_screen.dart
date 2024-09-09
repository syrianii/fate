import 'package:flutter/material.dart';

class RestaurantErrorScreen extends StatelessWidget {
  const RestaurantErrorScreen({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
      ),
    );
  }
}
