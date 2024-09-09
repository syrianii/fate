import 'package:fate_test_app/common/extensions.dart';
import 'package:fate_test_app/features/home/presentation/providers/restaurant_providers.dart';
import 'package:fate_test_app/features/home/presentation/restaurant_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSearchBar extends ConsumerStatefulWidget {
  const CustomSearchBar({super.key});

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends ConsumerState<CustomSearchBar> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    // Adding listener to perform search as the user types
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    // Remove listener and dispose the controller when widget is disposed
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String currentText = searchController.text;
    if (currentText.isEmpty) {
      ref.read(restaurantControllerProvider.notifier).loadRestaurants();
    } else {
      ref
          .read(restaurantControllerProvider.notifier)
          .searchRestaurants(currentText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          labelText: context.loc.searchRestaurantsText,
          suffixIcon: const Icon(Icons.search),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
