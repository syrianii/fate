import 'package:fate_test_app/features/home/domain/restaurant.dart';
import 'package:fate_test_app/features/home/presentation/widgets/restaurant_image.dart';
import 'package:flutter/material.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({
    super.key,
    required this.restaurant,
    required this.image,
  });

  final String image;
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: RestaurantImage(image: image),
        title: Text(restaurant.name),
        subtitle: Row(
          children: [
            const Icon(
              Icons.restaurant,
              size: 15,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(restaurant.cuisine),
          ],
        ),
      ),
    );
  }
}
