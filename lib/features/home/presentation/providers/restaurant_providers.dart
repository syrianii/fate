import 'package:fate_test_app/features/home/application/restaurant_service.dart';
import 'package:fate_test_app/features/home/application/restaurant_service_impl.dart';
import 'package:fate_test_app/features/home/data/data_source/restaurant_data_source.dart';
import 'package:fate_test_app/features/home/data/data_source/restaurant_data_source_impl.dart';
import 'package:fate_test_app/features/home/data/repository/restaurant_repository.dart';
import 'package:fate_test_app/features/home/data/repository/restaurant_repository_impl.dart';
import 'package:fate_test_app/features/home/domain/restaurant.dart';
import 'package:fate_test_app/features/home/presentation/controller/restaurant_controller.dart';
import 'package:fate_test_app/features/home/presentation/controller/restaurant_controller_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantDataSourceProvider = Provider<RestaurantDataSource>((ref) {
  return RestaurantDataSourceImpl();
});

final restaurantRepositoryProvider = Provider<RestaurantRepository>((ref) {
  return RestaurantRepositoryImpl(ref.read(restaurantDataSourceProvider));
});

final restaurantServiceProvider = Provider<RestaurantService>((ref) {
  return RestaurantServiceImpl(ref.read(restaurantRepositoryProvider));
});

final restaurantControllerProvider =
    StateNotifierProvider<RestaurantController, AsyncValue<List<Restaurant>>>(
        (ref) {
  return RestaurantControllerImpl(ref.read(restaurantServiceProvider));
});
