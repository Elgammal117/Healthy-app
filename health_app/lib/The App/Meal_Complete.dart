import 'package:flutter/material.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/Button.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/NutritionCard.dart';
import 'package:health_app/The%20App/App.dart';
import 'package:health_app/network/AddMeal.dart';
import 'package:health_app/network/injection.dart';
import 'package:health_app/network/my_repo.dart';
import 'package:health_app/network/recipes_try.dart';
import 'package:intl/intl.dart';
import 'dart:ui';

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

          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 60),

                    const Text(
                      "Meal Completed",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
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

                    onPressed: () async {
                      try {
                        final request = AddMealRequest(
                          recipeId: widget.foodId,
                          date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                        );
                        final myrepo = getIt<MyRepo>();
                        final respons = await myrepo.addMeal(
                          widget.token,
                          request,
                        );
                        if (respons.success == true) {
                          showIOSSuccess(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Failed to log meal: ${respons.message}',
                              ),
                            ),
                          );
                        }
                      } catch (e) {}
                    },

                    icon: const Icon(
                      color: Color.fromARGB(255, 255, 255, 255),
                      Icons.bar_chart,
                    ),
                    label: const Text(
                      "Log to Daily Tracker",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ================= RATING =================
                const Text(
                  "Rate this Meal",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),

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

                // ================= ACTIONS =================
                // Row(
                //   children: [
                //     // Upload
                //     Expanded(
                //       child: OutlinedButton.icon(
                //         style: OutlinedButton.styleFrom(
                //           padding: const EdgeInsets.symmetric(vertical: 14),
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(16),
                //           ),
                //         ),

                //         onPressed: () {},

                //         icon: const Icon(Icons.camera_alt_outlined),
                //         label: const Text("Upload Photo"),
                //       ),
                //     ),

                //     const SizedBox(width: 12),

                //     // Share
                //     Expanded(
                //       child: OutlinedButton.icon(
                //         style: OutlinedButton.styleFrom(
                //           padding: const EdgeInsets.symmetric(vertical: 14),
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(16),
                //           ),
                //         ),

                //         onPressed: () {},

                //         icon: const Icon(Icons.group),
                //         label: const Text("Share with Friends"),
                //       ),
                //     ),
                //   ],
                // ),
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

void showIOSSuccess(BuildContext context) {
  final overlay = Overlay.of(context);

  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: Duration(milliseconds: 250),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.scale(
                  scale: 0.9 + (value * 0.1),
                  child: child,
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 🔄 Spinner (loading style)
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.check, color: Colors.green, size: 50),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "Meal Logged \n Successfully!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );

  overlay.insert(overlayEntry);

  // ⏱️ Remove after 1 second
  Future.delayed(Duration(milliseconds: 2500), () {
    overlayEntry.remove();
  });
}

// ================= CARD =================
