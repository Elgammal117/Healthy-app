import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  int? selectedActivity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F4F6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),

              Text(
                "What's your activity level?",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 100),
              GestureDetector(
                onTap: () {
                  selectedActivity = 0;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedActivity == 0
                          ? Color(0xff13EC80)
                          : Color(0xffCFE7DB),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 100,
                  width: 320,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Icon(Icons.airline_seat_flat),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sedentary",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Little or no exercise",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff4C9A73),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 16),
                        Spacer(),
                        Container(
                          width: 25, // circle width
                          height: 25, // circle height
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // makes it circular
                            border: Border.all(
                              color: selectedActivity == 0
                                  ? Color(0xff13EC80)
                                  : Color(0xffCFE7DB), // border color
                              width: 3, // border thickness
                            ),
                            color: Colors
                                .transparent, // inner color (transparent for your image look)
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  selectedActivity = 1;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedActivity == 1
                          ? Color(0xff13EC80)
                          : Color(0xffCFE7DB),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 100,
                  width: 320,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                            "assets/sedentary.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sedentary",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Little or no exercise",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff4C9A73),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 16),
                        Spacer(),
                        Container(
                          width: 25, // circle width
                          height: 25, // circle height
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // makes it circular
                            border: Border.all(
                              color: selectedActivity == 1
                                  ? Color(0xff13EC80)
                                  : Color(0xffCFE7DB), // border color
                              width: 3, // border thickness
                            ),
                            color: Colors
                                .transparent, // inner color (transparent for your image look)
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Spacer(),
              Text(
                textAlign: TextAlign.center,
                "This helps us calculate your daily calorie and macro goals with high precision.",
                style: TextStyle(color: Color(0xff6B7280), fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
