import 'package:flutter/material.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/FoodCard.dart';
import 'package:health_app/network/Favo.dart';
import 'package:health_app/network/injection.dart';
import 'package:health_app/network/my_repo.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Favorite extends StatefulWidget {
  final String token;

  Favorite({super.key, required this.token});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  late Future<Favo> favoritesFuture;
  int mealCount = 128;

  @override
  void initState() {
    super.initState();
    final myRepo = getIt<MyRepo>();
    favoritesFuture = myRepo.getFavorites(widget.token);
  }

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              // ✅ Important
              child: Column(
                children: [
                  // Count
                  Text(
                    "Recipes",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2FA36B),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Grid
                  // Replace the GridView.builder part with this:
                  FutureBuilder<Favo>(
                    future: favoritesFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      // Update mealCount with results from API
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (snapshot.data?.results != null &&
                            snapshot.data!.results != mealCount) {
                          setState(() {
                            mealCount = snapshot.data!.results!;
                          });
                        }
                      });

                      final recipes = snapshot.data?.data ?? [];
                      if (recipes.isEmpty) {
                        return const Center(child: Text('No recipes found.'));
                      }

                      return Expanded(
                        child: MasonryGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          itemCount: recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = recipes[index];
                            return RecipeCard(
                              imageUrl: recipe.image?.secureUrl ?? '',
                              title: recipe.name ?? 'No name',
                              calories: recipe.calories ?? 0,
                              protein: recipe.macros?.protein ?? 0,
                              carbs: recipe.macros?.carbohydrates ?? 0,
                              fat: recipe.macros?.fats ?? 0,
                              cookTime: recipe.cookingTime ?? 0,
                            );
                          },
                        ),
                      );
                    },
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
