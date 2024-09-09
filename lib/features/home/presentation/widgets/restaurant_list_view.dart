import 'package:fate_test_app/features/home/presentation/providers/restaurant_providers.dart';
import 'package:fate_test_app/features/home/presentation/state/restaurant_empty_screen.dart';
import 'package:fate_test_app/features/home/presentation/state/restaurant_error_screen.dart';
import 'package:fate_test_app/features/home/presentation/state/restaurant_loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantListView extends ConsumerWidget {
  const RestaurantListView({super.key});

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
                  return ListTile(
                    title: Text(restaurant.name),
                    subtitle: Text(restaurant.cuisine),
                  );
                },
              );
      },
      error: (error, stack) => RestaurantErrorScreen(error: '$error'),
      loading: () => const RestaurantLoadingScreen(),
    );
  }
}
