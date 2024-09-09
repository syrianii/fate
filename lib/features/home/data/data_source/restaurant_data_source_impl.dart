import 'dart:convert';
import 'package:fate_test_app/common/assets_path.dart';
import 'package:fate_test_app/features/home/data/data_source/restaurant_data_source.dart';
import 'package:flutter/services.dart';

class RestaurantDataSourceImpl implements RestaurantDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchRestaurantData() async {
    final String jsonString =
        await rootBundle.loadString(AssetPaths.restaurantData);
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.cast<Map<String, dynamic>>();
  }
}
