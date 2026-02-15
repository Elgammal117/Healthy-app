import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // ================= USER INFO =================
              Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 3),
                        ),
                        child: const CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage(
                            "assets/Profile.png",
                          ), // your image
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "Mohammed",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "● FAT LOSS | MODERATE ACTIVITY",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ================= BODY STATS =================
              _buildCard(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "BODY STATS",
                          style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 1,
                          ),
                        ),
                        Icon(Icons.edit, color: Colors.green),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        _StatBox(title: "HEIGHT (CM)", value: "177"),
                        _StatBox(title: "WEIGHT (KG)", value: "80"),
                        _StatBox(title: "AGE (YRS)", value: "22"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ================= NUTRITION GOALS =================
              _buildCard(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "NUTRITION GOALS",
                          style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 1,
                          ),
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("RECALCULATE"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "2,200",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Text(
                      "DAILY CALORIE TARGET",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        _MacroBox(
                          color: Colors.blue,
                          title: "PROTEIN",
                          value: "150g",
                        ),
                        _MacroBox(
                          color: Colors.orange,
                          title: "CARBS",
                          value: "200g",
                        ),
                        _MacroBox(
                          color: Colors.red,
                          title: "FATS",
                          value: "70g",
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ================= WEEKLY PROGRESS =================
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.green, Color(0xFF00E676)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "WEEKLY PROGRESS",
                      style: TextStyle(color: Colors.white70, letterSpacing: 1),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "85% Goal Achieved",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: 0.85,
                        minHeight: 8,
                        backgroundColor: Colors.white24,
                        valueColor: const AlwaysStoppedAnimation(Colors.black),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "CONSISTENCY IS KEY",
                          style: TextStyle(color: Colors.white70),
                        ),
                        Text(
                          "4/7 DAYS TRACKED",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ================= MENU =================
              _MenuTile(
                icon: Icons.settings,
                title: "Settings",
                color: Colors.blueGrey,
              ),
              SizedBox(height: 12),

              _MenuTile(
                icon: Icons.info,
                title: "About the App",
                color: Colors.blueGrey,
              ),
              SizedBox(height: 12),

              _MenuTile(icon: Icons.logout, title: "Logout", color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  // Card Wrapper
  Widget _buildCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 10),
        ],
      ),
      child: child,
    );
  }
}

// ================= STAT BOX =================
class _StatBox extends StatelessWidget {
  final String title;
  final String value;

  const _StatBox({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= MACRO BOX =================
class _MacroBox extends StatelessWidget {
  final Color color;
  final String title;
  final String value;

  const _MacroBox({
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withOpacity(.3)),
        ),
        child: Column(
          children: [
            CircleAvatar(radius: 4, backgroundColor: color),

            const SizedBox(height: 6),

            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= MENU TILE =================
class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const _MenuTile({
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
