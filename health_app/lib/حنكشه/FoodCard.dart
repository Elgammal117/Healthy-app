import 'package:flutter/material.dart';
import 'package:health_app/The%20App/Food_ingredients.dart';
import 'package:health_app/network/injection.dart';
import 'package:health_app/network/my_repo.dart';

class RecipeCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final int calories;
  final int protein;
  final int carbs;
  final int fat;
  final int cookTime;
  final bool isFav;
  final String token;
  final String foodId;

  const RecipeCard({
    super.key,

    required this.token,
    required this.foodId,
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
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  late bool isFav;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Food_Ingredients(token: widget.token),
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
                  widget.imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    print(
                      'Image Error for ${widget.imageUrl}: $error',
                    ); // Debug log
                    return Container(
                      height: 120,
                      color: Colors.grey[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.broken_image, color: Colors.grey),
                          const SizedBox(height: 4),
                          Text(
                            'URL: ${widget.imageUrl}',
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
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 8),

                    _buildMacro('${widget.calories} kcal'),

                    Row(
                      children: [
                        _buildMacro('${widget.protein}g P'),
                        _buildMacro('${widget.carbs}g C'),
                        _buildMacro('${widget.fat}g F'),
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
                            Text('${widget.cookTime} min'),
                          ],
                        ),

                        IconButton(
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav
                                ? const Color(0xFF00C896)
                                : Colors.grey,
                          ),
                          onPressed: () async {
                            try {
                              debugPrint('foodId: ${widget.foodId}');
                              debugPrint('token: ${widget.token}');
                              final repo = getIt<MyRepo>();
                              final response = await repo.addFavorite(
                                widget.token,
                                widget.foodId,
                              );

                              if (response.success == true) {
                                setState(() {
                                  // Toggle favorite state
                                  isFav = !isFav;
                                });
                              }
                            } catch (e) {
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Failed to update favorite'),
                                ),
                              );
                            }
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
