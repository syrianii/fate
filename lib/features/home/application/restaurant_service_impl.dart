import 'package:fate_test_app/features/home/application/restaurant_service.dart';
import 'package:fate_test_app/features/home/data/repository/restaurant_repository.dart';
import 'package:fate_test_app/features/home/domain/restaurant.dart';

class RestaurantServiceImpl extends RestaurantService {
  final RestaurantRepository _repository;

  RestaurantServiceImpl(this._repository);

  @override
  Future<List<Restaurant>> loadRestaurants() async {
    return await _repository.fetchRestaurants();
  }

  @override
  List<Restaurant> searchRestaurants(
      String query, List<Restaurant> restaurants) {
    return restaurants
        .where((restaurant) =>
            restaurant.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
