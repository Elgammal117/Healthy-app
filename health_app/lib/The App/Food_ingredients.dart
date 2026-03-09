import 'package:flutter/material.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/Button.dart';
import 'package:health_app/The%20App/Steps.dart';

class Food_Ingredients extends StatefulWidget {
  final String token;

  const Food_Ingredients({Key? key, required this.token}) : super(key: key);

  @override
  State<Food_Ingredients> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<Food_Ingredients> {
  final List<bool> _selectedIngredients = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F8F6),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image Section
            Stack(
              children: [
                SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: ClipRRect(
                    child: Image.asset("assets/Salamon.png", fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
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
                  const Text(
                    'Zesty Lemon Salmon',
                    style: TextStyle(
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
                        '20 mins',
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
                      nutrition("Calories", "450", "Kcal", Colors.black),
                      nutrition("Protein", "33", "Grams", Color(0xff37EC13)),
                      nutrition("Carbs", "10", "Grams", Color(0xffF59E0B)),
                      nutrition("Fats", "15", "Grams", Color(0xffF87171)),
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
                    'A refreshing, nutrient-dense dinner that packs a punch of Omega-3s. The zesty lemon glaze perfectly complements the buttery texture of the Atlantic salmon, finished with fresh herbs for',
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
                        colors: [Colors.green[400]!, Colors.green[100]!],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Ingredients List
                  _buildIngredient(
                    0,
                    'Atlantic Salmon Fillet',
                    'Fresh, Skin-on',
                    '180g',
                  ),
                  _buildIngredient(
                    1,
                    'Lemon Juice & Zest',
                    'Organic Lemon',
                    '1/2 pc',
                  ),
                  _buildIngredient(
                    2,
                    'Extra Virgin Olive Oil',
                    'Cold Pressed',
                    '1 tbsp',
                  ),
                  _buildIngredient(3, 'Fresh Dill & Parsley', 'Chopped', '5g'),
                  _buildIngredient(
                    4,
                    'Sea Salt & Black Pepper',
                    'To taste',
                    'Pinch',
                  ),

                  const SizedBox(height: 20),
                  Button("Lets Cook", Steps(token: widget.token)),
                ],
              ),
            ),
          ],

          // Bottom Button Bar
        ),
      ),
    );
  }

  Widget nutrition(String label, String value, String subtitle, Color color) {
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
            value,
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

  Widget _buildIngredient(
    int index,
    String name,
    String detail,
    String amount,
  ) {
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
                Text(
                  detail,
                  style: TextStyle(fontSize: 13, color: Colors.grey[500]),
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
