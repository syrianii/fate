import 'package:fate_test_app/features/home/data/data_source/restaurant_data_source.dart';
import 'package:fate_test_app/features/home/data/repository/restaurant_repository.dart';
import 'package:fate_test_app/features/home/domain/restaurant.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantDataSource dataSource;

  RestaurantRepositoryImpl(this.dataSource);

  @override
  Future<List<Restaurant>> fetchRestaurants() async {
    final data = await dataSource.fetchRestaurantData();
    return data.map((json) => Restaurant.fromJson(json)).toList();
  }
}
