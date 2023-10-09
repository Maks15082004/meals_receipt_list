import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_receipt_list/models/meal.dart';

class FavoriteMealsNotitfier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotitfier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotitfier, List<Meal>>((ref) {
  return FavoriteMealsNotitfier();
});
