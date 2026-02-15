import 'package:flutter/material.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/FoodCard.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/MealTag.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/filter_bottom_sheet.dart';
import 'package:health_app/The%20App/Favorite.dart';

class FilteredResultsScreen extends StatefulWidget {
  const FilteredResultsScreen({Key? key}) : super(key: key);

  @override
  State<FilteredResultsScreen> createState() => _FilteredResultsScreenState();
}

class _FilteredResultsScreenState extends State<FilteredResultsScreen> {
  List<String> activeFilters = ['Under 500 kcal', 'High Protein'];
  String sortBy = 'Calories Low to High';
  int mealCount = 128;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Filtered Results',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search and Filter Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
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
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      RecipeCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
                        title: 'Zesty Lemon Garlic Salmon',
                        calories: 420,
                        protein: 35,
                        carbs: 10,
                        fat: 2,
                        cookTime: 15,
                      ),
                      RecipeCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
                        title: 'eggs',
                        calories: 420,
                        protein: 35,
                        carbs: 10,
                        fat: 2,
                        cookTime: 15,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      RecipeCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
                        title: 'chicken',
                        calories: 420,
                        protein: 35,
                        carbs: 10,
                        fat: 2,
                        cookTime: 15,
                      ),
                      RecipeCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
                        title: 'Beef',
                        calories: 420,
                        protein: 35,
                        carbs: 10,
                        fat: 2,
                        cookTime: 15,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      RecipeCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
                        title: 'Lemon',
                        calories: 420,
                        protein: 35,
                        carbs: 10,
                        fat: 2,
                        cookTime: 15,
                      ),
                      RecipeCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
                        title: 'tomato',
                        calories: 420,
                        protein: 35,
                        carbs: 10,
                        fat: 2,
                        cookTime: 15,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      RecipeCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
                        title: 'Rice',
                        calories: 420,
                        protein: 35,
                        carbs: 10,
                        fat: 2,
                        cookTime: 15,
                      ),
                      RecipeCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
                        title: 'Meat',
                        calories: 420,
                        protein: 35,
                        carbs: 10,
                        fat: 2,
                        cookTime: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Expanded(
            //           child: MasonryGridView.count(
            //             crossAxisCount: 2, // same as your previous grid
            //             mainAxisSpacing: 16,
            //             itemCount: API.length,
            //             itemBuilder: (context, index) {
            //               final food = API[index];

            //               return RecipeCard(
            //                 imageUrl: food["image"]!,
            //                 title: food["name"]!,
            //                 calories: int.parse(food["calories"]!),
            //                 protein: int.parse(food["protein"]!),
            //                 carbs: int.parse(food["carbs"]!),
            //                 fat: int.parse(food["fat"]!),
            //                 cookTime: int.parse(food["cookTime"]!),
            //               );
            //             },
            //           ),
            //         ),

            // Empty Results Area (since the screenshot shows empty space)
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
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filtered Results',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const FilteredResultsScreen(),
    );
  }
}
