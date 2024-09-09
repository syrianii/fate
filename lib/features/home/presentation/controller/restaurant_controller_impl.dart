import 'package:fate_test_app/features/home/application/restaurant_service.dart';
import 'package:fate_test_app/features/home/presentation/controller/restaurant_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantControllerImpl extends RestaurantController {
  final RestaurantService _service;

  RestaurantControllerImpl(this._service) : super(const AsyncLoading()) {
    loadRestaurants();
  }

  @override
  void loadRestaurants() async {
    try {
      final restaurants = await _service.loadRestaurants();
      state = AsyncData(restaurants);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  @override
  void searchRestaurants(String query) {
    if (state.value != null) {
      final filtered = _service.searchRestaurants(query, state.value!);
      state = AsyncData(filtered);
    }
  }
}
