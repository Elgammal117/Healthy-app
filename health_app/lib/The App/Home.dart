import 'package:flutter/material.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/MealTag.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/macroBar.dart';
import 'package:health_app/network/injection.dart';
import 'package:health_app/network/my_repo.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  final String token;

  const HomePage({super.key, required this.token});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int eaten = 0;
  int total = 2200;

  int protein = 0;
  int proteinTotal = 150;

  int carbs = 0;
  int carbsTotal = 200;

  int fats = 0;
  int fatsTotal = 70;
  int selectedindex = 0;
  @override
  void initState() {
    super.initState();
    _loadHomeData();
  }

  Future<void> _loadHomeData() async {
    try {
      final respons = getIt<MyRepo>();
      final repo = await respons.getProfile(widget.token);
      if (!mounted) return;

      if (repo.success == true) {
        setState(() {
          total = repo.data?.dailyCalories ?? 0;
          proteinTotal = repo.data?.macros?.protein ?? 0;
          carbsTotal = repo.data?.macros?.carbohydrates ?? 0;
          fatsTotal = repo.data?.macros?.fats ?? 0;
        });
      }
    } catch (e) {
      print("Error occurred while loading home data: $e");
    }
  }

  DateTime _selectedDate = DateTime.now(); // current date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset("assets/Profile.png", fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Mohammed Elgammal",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(Icons.notifications, size: 30),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          child: ListView(
            children: [
              TableCalendar(
                firstDay: DateTime(2020, 1, 1),
                lastDay: DateTime(2030, 12, 31),

                focusedDay: _selectedDate,

                calendarFormat: CalendarFormat.week, // 👈 IMPORTANT

                availableCalendarFormats: const {CalendarFormat.week: 'Week'},

                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDate, day);
                },

                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDate = selectedDay;
                  });
                },

                headerStyle: const HeaderStyle(
                  titleTextStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  formatButtonVisible: false,
                  titleCentered: true,
                ),

                calendarStyle: CalendarStyle(
                  // Normal days
                  defaultTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                  // Selected day
                  selectedTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),

                  // Today
                  todayTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),

                  // Weekend
                  weekendTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                  // Days from other months (if shown)
                  outsideTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),

                  selectedDecoration: const BoxDecoration(
                    color: Color(0xff13EC80),
                    shape: BoxShape.circle,
                  ),

                  todayDecoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    // ================= CIRCLE =================
                    SizedBox(
                      width: 160,
                      height: 160,

                      child: Stack(
                        alignment: Alignment.center,

                        children: [
                          CircularProgressIndicator(
                            constraints: BoxConstraints(
                              minHeight: 150,
                              minWidth: 150,
                            ),

                            value: eaten / total, // progress
                            strokeWidth: 10,
                            backgroundColor: Colors.grey.shade200,
                            color: const Color(0xff13EC80),
                          ),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                eaten.toInt().toString(),
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(
                                "/ ${total.toInt()} KCAL",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                "${(total - eaten).toInt()} left",
                                style: const TextStyle(
                                  color: Color(0xff13EC80),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    macroBar("Protein", protein, proteinTotal),
                    const SizedBox(height: 15),

                    macroBar("Carbs", carbs, carbsTotal),
                    const SizedBox(height: 15),

                    macroBar("Fats", fats, fatsTotal),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Text(
                'Recommended for You',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 4),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 14, color: Color(0xFF4C9A73)),
                  children: [
                    TextSpan(text: 'Based on your remaining '),
                    TextSpan(
                      text: '800 kcal',
                      style: TextStyle(
                        color: Color(0xFF13EC80),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              MealCard(
                title: 'Grilled Salmon & Avocado',
                calories: 450,
                cookTime: 20,
                protein: 35,
                carbs: 10,
                fat: 2,
                imageUrl: 'assets/salmon.jpg',
                isFavorite: true,
              ),
              SizedBox(height: 10),
              MealCard(
                protein: 35,
                carbs: 10,
                fat: 2,
                title: 'Quinoa Harvest Bowl',
                calories: 380,
                cookTime: 15,

                imageUrl: 'assets/quinoa.jpg',
                isFavorite: false,
              ),
              SizedBox(height: 10),
              MealCard(
                protein: 35,
                carbs: 10,
                fat: 2,
                title: 'Zucchini Pesto Zoodles',
                calories: 290,
                cookTime: 10,
                imageUrl: 'assets/zoodles.jpg',
                isFavorite: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
