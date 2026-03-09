import 'package:flutter/material.dart';
import 'package:health_app/The%20App/Meal_Complete.dart';

class Steps extends StatelessWidget {
  final String token;

  const Steps({super.key, required this.token});

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
          "Lemony Herb Chicken",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),

        centerTitle: true,
      ),

      body: Column(
        children: [
          // Progress Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Sautéing Aromatics",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text("Step 3 of 10", style: TextStyle(color: Colors.grey)),
                  ],
                ),

                const SizedBox(height: 10),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.3, // 3 / 10
                    minHeight: 8,
                    backgroundColor: Colors.green.shade100,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text(
                    "Step 3",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Finely dice the onion and sauté in the pan "
                    "with a drizzle of olive oil until they become "
                    "translucent and fragrant, about 3–4 minutes.",

                    style: TextStyle(fontSize: 17, height: 1.5),
                  ),

                  const SizedBox(height: 30),

                  // Macro Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: const [
                        Text(
                          "Macro Context",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),

                        SizedBox(height: 5),

                        Text(
                          "Adding 45 kcal • 2g Healthy Fats",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Timer Button
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),

                    child: ListTile(
                      leading: const Icon(Icons.timer),
                      title: const Text("Set 4-minute timer"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {},
                    ),
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),

          // Bottom Buttons
          Container(
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                ),
              ],
            ),

            child: Row(
              children: [
                // Back
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},

                    icon: const Icon(Icons.arrow_back),

                    label: const Text("Back"),

                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                // Next
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealCompletedScreen(token: token),
                        ),
                      );
                    },

                    icon: const Text(""),

                    label: const Text("Next Step →"),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff37EC13),
                      foregroundColor: Colors.white,

                      padding: const EdgeInsets.symmetric(vertical: 15),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
