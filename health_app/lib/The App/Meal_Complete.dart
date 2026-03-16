import 'package:flutter/material.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/Button.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/NutritionCard.dart';
import 'package:health_app/The%20App/App.dart';
import 'package:health_app/network/injection.dart';
import 'package:health_app/network/my_repo.dart';
import 'package:health_app/network/recipes_try.dart';

class MealCompletedScreen extends StatefulWidget {
  final String token;
  final String foodId;

  const MealCompletedScreen({
    super.key,
    required this.token,
    required this.foodId,
  });

  @override
  State<MealCompletedScreen> createState() => _MealCompletedScreenState();
}

class _MealCompletedScreenState extends State<MealCompletedScreen> {
  int rating = 4;
  late Future<RecipeById> recipe;
  final myrepo = getIt<MyRepo>();
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
          backgroundColor: const Color(0xFFF9FBF7),

          appBar: AppBar(
            backgroundColor: const Color(0xFFF9FBF7),
            elevation: 0,

            leading: IconButton(
              icon: const Icon(Icons.close, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),

            title: const Text(
              "Meal Completed",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),

            centerTitle: true,
          ),

          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // ================= IMAGE CARD =================
                Container(
                  height: 220,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(recipeData.image?.secureUrl ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),

                  child: Container(
                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(.7),
                          Colors.transparent,
                        ],
                      ),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 22,
                            ),

                            SizedBox(width: 6),

                            Text(
                              "Bon Appétit!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "You just finished the ${recipeData.name}",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // ================= NUTRITION =================
                const Text(
                  "Nutrition Summary",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    NutritionCard(
                      "Calories",
                      recipeData.calories ?? 0,
                      "kcal",
                      true,
                    ),
                    SizedBox(width: 12),
                    NutritionCard(
                      "Protein",
                      recipeData.macros?.protein ?? 0,
                      "g",
                      false,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    NutritionCard(
                      "Carbs",
                      recipeData.macros?.carbohydrates ?? 0,
                      "g",
                      false,
                    ),
                    SizedBox(width: 12),

                    NutritionCard(
                      "Fats",
                      recipeData.macros?.fats ?? 0,
                      "g",
                      false,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ================= BUTTON =================
                SizedBox(
                  width: double.infinity,
                  height: 70,

                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff37EC13),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    onPressed: () {},

                    icon: const Icon(color: Colors.black, Icons.bar_chart),
                    label: const Text(
                      "Log to Daily Tracker",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // ================= RATING =================
                const Text(
                  "Rate this Meal",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 10),

                Row(
                  children: List.generate(
                    5,
                    (index) => IconButton(
                      onPressed: () {
                        setState(() {
                          rating = index + 1;
                        });
                      },

                      icon: Icon(
                        index < rating ? Icons.star : Icons.star_border,

                        color: Color(0xff37EC13),
                        size: 30,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ================= ACTIONS =================
                Row(
                  children: [
                    // Upload
                    Expanded(
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),

                        onPressed: () {},

                        icon: const Icon(Icons.camera_alt_outlined),
                        label: const Text("Upload Photo"),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Share
                    Expanded(
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),

                        onPressed: () {},

                        icon: const Icon(Icons.group),
                        label: const Text("Share with Friends"),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                Button("Home", App(token: widget.token)),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ================= CARD =================
