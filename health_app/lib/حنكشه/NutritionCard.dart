import 'package:flutter/material.dart';

class NutritionCard extends StatelessWidget {
  final String title;
  final int value;
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
                  value.toString(),
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
