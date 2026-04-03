import 'package:flutter/material.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/Button.dart';
import 'package:health_app/The%20App/Steps.dart';
import 'package:health_app/network/injection.dart';
import 'package:health_app/network/my_repo.dart';
import 'package:health_app/network/recipes_try.dart' hide Steps, Image;

class Food_Ingredients extends StatefulWidget {
  final String token;
  final String foodId;
  const Food_Ingredients({Key? key, required this.token, required this.foodId})
    : super(key: key);

  @override
  State<Food_Ingredients> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<Food_Ingredients> {
  late Future<RecipeById> recipe;
  final myrepo = getIt<MyRepo>();
  final List<bool> _selectedIngredients = [false, false, false, false, false];

  @override
  void initState() {
    super.initState();
    recipe = myrepo.getrecipebyid(widget.foodId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RecipeById>(
      future: recipe,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(backgroundColor: Colors.white),
          );
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final recipeData = snapshot.data?.data;
        if (recipeData == null) {
          return const Center(child: Text('No recipe data found'));
        }
        return Scaffold(
          backgroundColor: Color(0xffF6F8F6),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 220,
                          width: double.infinity,
                          child: ClipRRect(
                            child: Image.network(
                              recipeData.image?.secureUrl ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),

                    // Content Section
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Tags
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'High Protein',
                                  style: TextStyle(
                                    color: Colors.green[700],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Keto Friendly',
                                  style: TextStyle(
                                    color: Colors.blue[700],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Title
                          Text(
                            recipeData.name ?? '',
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Info Row
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 16,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${recipeData.cookingTime} min',
                                style: TextStyle(
                                  color: Color(0xff64748B),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Icon(
                                Icons.restaurant,
                                size: 16,
                                color: Color(0xff64748B),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '1 Serving',
                                style: TextStyle(
                                  color: Color(0xff64748B),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),

                          // Nutrition Info
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              nutrition(
                                "Calories",
                                recipeData.calories ?? 0,
                                "Kcal",
                                Colors.black,
                              ),
                              nutrition(
                                "Protein",
                                recipeData.macros?.protein ?? 0,
                                "Grams",
                                Color(0xff37EC13),
                              ),
                              nutrition(
                                "Carbs",
                                recipeData.macros?.carbohydrates ?? 0,
                                "Grams",
                                Color(0xffF59E0B),
                              ),
                              nutrition(
                                "Fats",
                                recipeData.macros?.fats ?? 0,
                                "Grams",
                                Color(0xffF87171),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),

                          // Description
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            recipeData.description ??
                                'No description available.',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700],
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Ingredients Header
                          const Text(
                            'Ingredients',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 3,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.green[400]!,
                                  Colors.green[100]!,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Ingredients List
                          for (
                            int i = 0;
                            i < (recipeData.ingredients?.length ?? 0);
                            i++
                          )
                            _buildIngredient(
                              i,
                              recipeData.ingredients?[i].name ?? '',
                              recipeData.ingredients?[i].quantity ?? '',
                            ),

                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Floating Button at Bottom
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Button(
                  "Lets Cook",
                  Steps(
                    foodId: widget.foodId,
                    token: widget.token,
                    steps: recipeData.steps ?? [],
                    name: recipeData.name ?? '',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget nutrition(String label, int value, String subtitle, Color color) {
    return Container(
      height: 100,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color(0xff94A3B8),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value.toString(),
            style: TextStyle(
              color: color,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(color: Color(0xff94A3B8), fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredient(int index, String name, String amount) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIngredients[index] = !_selectedIngredients[index];
              });
            },
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectedIngredients[index]
                    ? Colors.green[400]
                    : Colors.transparent,
                border: Border.all(
                  color: _selectedIngredients[index]
                      ? Colors.green[400]!
                      : Colors.grey[300]!,
                  width: 2,
                ),
              ),
              child: _selectedIngredients[index]
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
