import 'package:fate_test_app/features/home/presentation/widgets/restaurant_list_view.dart';
import 'package:fate_test_app/features/home/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantDataScreen extends ConsumerWidget {
  const RestaurantDataScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const CustomSearchBar(),
        Expanded(
          child: RestaurantListView(),
        ),
      ],
    );
  }
}
