import 'package:fate_test_app/features/home/domain/restaurant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class RestaurantController
    extends StateNotifier<AsyncValue<List<Restaurant>>> {
  RestaurantController(super.state);

  void loadRestaurants();
  void searchRestaurants(String query);
}
