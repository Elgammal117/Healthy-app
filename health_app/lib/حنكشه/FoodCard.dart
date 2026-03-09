import 'package:flutter/material.dart';
import 'package:health_app/The%20App/Food_ingredients.dart';
import 'package:provider/provider.dart';

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int calories;
  final int protein;
  final int carbs;
  final int fat;
  final int cookTime;
  final bool isFav;

  const RecipeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.cookTime,
    this.isFav = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Food_Ingredients(
              token:
                  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2OWE3NWMwNDM2MWE3OTIwMzQ4NDVkMDUiLCJlbWFpbCI6Im1vaGFtZWQuZ215NTU1QHlhaG9vLmNvbSIsImlhdCI6MTc3Mjc2MTgxOH0.OjxRKNnAxTi5TXi65qgiMXHvRc3vQGuyYM6e-r9E0X0',
            ),
          ),
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
                  errorBuilder: (context, error, stackTrace) {
                    print('Image Error for $imageUrl: $error'); // Debug log
                    return Container(
                      height: 120,
                      color: Colors.grey[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.broken_image, color: Colors.grey),
                          const SizedBox(height: 4),
                          Text(
                            'URL: $imageUrl',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    );
                  },
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
                          onPressed: () {},
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
