import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/FoodCard.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/filter_bottom_sheet.dart';
import 'package:health_app/network/my_repo.dart';
import 'package:health_app/network/recipes_try.dart';
import 'package:health_app/network/web_services.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key, this.token}) : super(key: key);
  final String? token;

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  List<String> activeFilters = ['Under 500 kcal', 'High Protein'];
  String sortBy = 'Calories Low to High';
  int mealCount = 128;

  late Future<Recipes> recipesFuture;
  final myRepo = MyRepo(WebServices(Dio()));
  @override
  void initState() {
    super.initState();
    recipesFuture = myRepo.getAllRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // Search and Filter Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Filtered Results',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search recipes, macros, ingredients...',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey[400],
                          size: 20,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height *
                                      0.75, // 75% of screen

                                  child: FilterBottomSheet(),
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.tune,
                            color: Colors.grey[600],
                            size: 20,
                          ),
                        ),

                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Filter Chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterChip(
                          'Under 500 kcal',
                          Colors.green,
                          isActive: activeFilters.contains('Under 500 kcal'),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterChip(
                          'High Protein',
                          Colors.green,
                          isActive: activeFilters.contains('High Protein'),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterChip(
                          'Gluten-Free',
                          Colors.grey[300]!,
                          isActive: false,
                          textColor: Colors.grey[700]!,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Results Count and Sort
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Showing $mealCount meals',
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: _showSortOptions,
                        child: Row(
                          children: [
                            Text(
                              'Sort: $sortBy',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            FutureBuilder<Recipes>(
              future: recipesFuture,
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
                        token: widget.token ?? 'error',
                        foodId: recipe.sId ?? '',
                        isFav: recipe.isFavorite ?? false,
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
    );
  }

  Widget _buildFilterChip(
    String label,
    Color backgroundColor, {
    required bool isActive,
    Color textColor = Colors.white,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? backgroundColor : backgroundColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isActive ? textColor : Colors.grey[700],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (isActive) ...[
            const SizedBox(width: 8),
            Icon(Icons.close, size: 16, color: textColor),
          ],
        ],
      ),
    );
  }

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sort By',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              _buildSortOption('Calories Low to High'),
              _buildSortOption('Calories High to Low'),
              _buildSortOption('Protein High to Low'),
              _buildSortOption('Protein Low to High'),
              _buildSortOption('Recently Added'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSortOption(String option) {
    final isSelected = sortBy == option;
    return ListTile(
      title: Text(
        option,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          color: isSelected ? Colors.green : Colors.black,
        ),
      ),
      trailing: isSelected
          ? const Icon(Icons.check, color: Colors.green)
          : null,
      onTap: () {
        setState(() {
          sortBy = option;
        });
        Navigator.pop(context);
      },
    );
  }
}

// Example usage in main.dart:
