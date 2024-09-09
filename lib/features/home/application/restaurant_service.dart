import 'package:fate_test_app/features/home/domain/restaurant.dart';

abstract class RestaurantService {
  Future<List<Restaurant>> loadRestaurants();
  List<Restaurant> searchRestaurants(
      String query, List<Restaurant> restaurants);
}
