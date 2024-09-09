import 'package:cached_network_image/cached_network_image.dart';
import 'package:fate_test_app/common/assets_path.dart';
import 'package:fate_test_app/features/home/domain/restaurant.dart';
import 'package:fate_test_app/features/home/presentation/providers/restaurant_providers.dart';
import 'package:fate_test_app/features/home/presentation/state/restaurant_empty_screen.dart';
import 'package:fate_test_app/features/home/presentation/state/restaurant_error_screen.dart';
import 'package:fate_test_app/features/home/presentation/state/restaurant_loading_screen.dart';
import 'package:fate_test_app/features/home/presentation/widgets/restaurant_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantListView extends ConsumerWidget {
  RestaurantListView({super.key});
  final List<String> restuarantsImages = [
    AssetPaths.bbqRestaurant,
    AssetPaths.italianRestaurant,
    AssetPaths.mexicanRestaurant,
    AssetPaths.americanRestaurant,
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantListState = ref.watch(restaurantControllerProvider);

    return restaurantListState.when(
      data: (restaurants) {
        return restaurants.isEmpty
            ? const RestaurantEmptyScreen()
            : ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return RestaurantTile(
                    image: restuarantsImages[index],
                    restaurant: restaurant,
                  );
                },
              );
      },
      error: (error, stack) => RestaurantErrorScreen(error: '$error'),
      loading: () => const RestaurantLoadingScreen(),
    );
  }
}
