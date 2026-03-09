import 'package:flutter/material.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/Button.dart';
import 'package:health_app/The%20App/App.dart';

class MealCompletedScreen extends StatefulWidget {
  final String token;
  
  const MealCompletedScreen({super.key, required this.token});

  @override
  State<MealCompletedScreen> createState() => _MealCompletedScreenState();
}

class _MealCompletedScreenState extends State<MealCompletedScreen> {
  int rating = 4;

  @override
  Widget build(BuildContext context) {
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
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
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
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe",
                  ),
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
                    colors: [Colors.black.withOpacity(.7), Colors.transparent],
                  ),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: const [
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 22),

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

                    SizedBox(height: 6),

                    Text(
                      "You just finished the Mediterranean Power Bowl",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
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
                NutritionCard("Calories", "450", "kcal", true),
                SizedBox(width: 12),
                NutritionCard("Protein", "32", "g", false),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                NutritionCard("Carbs", "48", "g", false),
                SizedBox(width: 12),

                NutritionCard("Fats", "14", "g", false),
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
  }
}

// ================= CARD =================

class NutritionCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final bool highlighted;

  const NutritionCard(
    this.title,
    this.value,
    this.unit,
    this.highlighted, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 170,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: highlighted ? Colors.green.withOpacity(.15) : Colors.white,

        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
            ),

            const SizedBox(height: 4),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 4),

                Text(
                  unit,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
