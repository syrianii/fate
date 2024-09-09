import 'package:fate_test_app/common/extensions.dart';
import 'package:fate_test_app/features/home/presentation/providers/restaurant_providers.dart';
import 'package:fate_test_app/features/home/presentation/state/restaurant_data_screen.dart';
import 'package:fate_test_app/features/home/presentation/state/restaurant_error_screen.dart';
import 'package:fate_test_app/features/home/presentation/state/restaurant_loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantListState = ref.watch(restaurantControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.restaurantsText),
      ),
      body: restaurantListState.when(
        data: (restaurants) => RefreshIndicator(
          onRefresh: () async {
            HapticFeedback
                .mediumImpact(); // Haptic feedback when pulled to refresh
            ref.read(restaurantControllerProvider.notifier).loadRestaurants();
          },
          child: const RestaurantDataScreen(),
        ),
        error: (error, stack) => RestaurantErrorScreen(error: '$error'),
        loading: () => const RestaurantLoadingScreen(),
      ),
    );
  }
}
