import 'package:fate_test_app/features/home/domain/restaurant.dart';

abstract class RestaurantRepository {
  Future<List<Restaurant>> fetchRestaurants();
}
