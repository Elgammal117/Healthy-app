import 'package:flutter/material.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/FoodCard.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/favorites_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesManager>().favorites;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Favorite Recipes',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // Search
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Saved recipes',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Empty
            if (favorites.isEmpty)
              const Text("No favorite dishes yet")
            else
              Expanded(
                // ✅ Important
                child: Column(
                  children: [
                    // Count
                    Text(
                      "${favorites.length} Recipes",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2FA36B),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Grid
                    // Replace the GridView.builder part with this:
                    Expanded(
                      child: MasonryGridView.count(
                        crossAxisCount: 2, // same as your previous grid
                        itemCount: favorites.length,
                        itemBuilder: (context, index) {
                          final food = favorites[index];

                          return RecipeCard(
                            imageUrl: food["image"]!,
                            title: food["name"]!,
                            calories: int.parse(food["calories"]!),
                            protein: int.parse(food["protein"]!),
                            carbs: int.parse(food["carbs"]!),
                            fat: int.parse(food["fat"]!),
                            cookTime: int.parse(food["cookTime"]!),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
