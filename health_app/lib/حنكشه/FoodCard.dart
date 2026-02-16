import 'package:flutter/material.dart';
import 'package:health_app/The%20App/Food_ingredients.dart';
import 'package:provider/provider.dart';
import 'package:health_app/حنكشه/favorites_manager.dart';

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int calories;
  final int protein;
  final int carbs;
  final int fat;
  final int cookTime;

  const RecipeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.cookTime,
  });

  @override
  Widget build(BuildContext context) {
    final favoritesManager = context.watch<FavoritesManager>();
    final isFav = favoritesManager.isFavorite(title);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Food_Ingredients()),
        );
      },
      child: SizedBox(
        width: 180,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
                  imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tag

                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 8),

                    _buildMacro('$calories kcal'),

                    Row(
                      children: [
                        _buildMacro('${protein}g P'),
                        _buildMacro('${carbs}g C'),
                        _buildMacro('${fat}g F'),
                      ],
                    ),

                    // Time + Favorite
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.access_time, size: 16),
                            const SizedBox(width: 4),
                            Text('$cookTime min'),
                          ],
                        ),

                        IconButton(
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav ? Color(0xFF00C896) : Colors.grey,
                          ),
                          onPressed: () {
                            favoritesManager.toggleFavorite({
                              "name": title,
                              "image": imageUrl,
                              "calories": calories.toString(),
                              "protein": protein.toString(),
                              "carbs": carbs.toString(),
                              "fat": fat.toString(),
                              "cookTime": cookTime.toString(),
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMacro(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}
