import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  // Calories Range
  RangeValues calories = const RangeValues(200, 800);

  // Chips
  String diet = "Vegan";
  String duration = "Easy";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle Bar
            Center(
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ================= HEADER =================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Filters",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                TextButton(
                  onPressed: resetAll,
                  child: const Text(
                    "Reset All",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ================= CALORIES =================
            const Text(
              "Calories (kcal)",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 10),

            RangeSlider(
              values: calories,
              min: 200,
              max: 1200,
              divisions: 20,
              activeColor: Colors.green,

              labels: RangeLabels(
                calories.start.round().toString(),
                calories.end.round().toString(),
              ),

              onChanged: (value) {
                setState(() {
                  calories = value;
                });
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("200 kcal"),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${calories.start.round()} - ${calories.end.round()}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const Text("1200+ kcal"),
              ],
            ),

            const SizedBox(height: 25),

            // ================= MACROS =================
            const Text(
              "Macros Target",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 15),

            macroRow("Protein", "High (35%)", 0.35, Colors.green),

            const SizedBox(height: 10),

            macroRow("Carbs", "Balanced (45%)", 0.45, Colors.lightGreen),

            const SizedBox(height: 10),

            macroRow("Fats", "Low (20%)", 0.20, Colors.green.shade200),

            const SizedBox(height: 25),

            // ================= DIET =================
            const Text(
              "Dietary Restrictions",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              children: [
                dietChip("Vegan"),
                dietChip("Keto"),
                dietChip("Gluten-Free"),
                dietChip("Dairy-Free"),
              ],
            ),

            const SizedBox(height: 25),

            // ================= DURATION =================
            const Text(
              "Duration",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              children: [durationChip("Easy"), durationChip("Normal")],
            ),

            const SizedBox(height: 30),

            // ================= BUTTON =================
            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                onPressed: applyFilters,

                child: const Text(
                  "Show 248 Recipes",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ================= MACRO ROW =================
  Widget macroRow(String title, String value, double progress, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(title),
            Text(value, style: const TextStyle(color: Colors.green)),
          ],
        ),

        const SizedBox(height: 6),

        ClipRRect(
          borderRadius: BorderRadius.circular(10),

          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),
      ],
    );
  }

  // ================= DIET CHIP =================
  Widget dietChip(String text) {
    final selected = diet == text;

    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),

          if (selected)
            const Padding(
              padding: EdgeInsets.only(left: 4),
              child: Icon(Icons.check, size: 16, color: Colors.white),
            ),
        ],
      ),

      selected: selected,

      selectedColor: Colors.green,

      backgroundColor: Colors.white,

      labelStyle: TextStyle(
        color: selected ? Colors.white : Colors.black,
        fontWeight: FontWeight.w600,
      ),

      shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade300)),

      onSelected: (_) {
        setState(() {
          diet = text;
        });
      },
    );
  }

  // ================= DURATION CHIP =================
  Widget durationChip(String text) {
    final selected = duration == text;

    return ChoiceChip(
      label: Text(text),

      selected: selected,

      selectedColor: Colors.green,

      backgroundColor: Colors.white,

      labelStyle: TextStyle(
        color: selected ? Colors.white : Colors.black,
        fontWeight: FontWeight.w600,
      ),

      shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade300)),

      onSelected: (_) {
        setState(() {
          duration = text;
        });
      },
    );
  }

  // ================= ACTIONS =================
  void resetAll() {
    setState(() {
      calories = const RangeValues(200, 800);
      diet = "Vegan";
      duration = "Easy";
    });
  }

  void applyFilters() {
    // Here you pass values to Provider / API

    Navigator.pop(context);
  }
}
