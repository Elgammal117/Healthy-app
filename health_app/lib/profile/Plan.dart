import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/profile/CreateProfile.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;

  const PageIndicator({
    super.key,
    required this.currentIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final bool isActive = index == currentIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 22 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xff13EC80) : const Color(0xffCFE7DB),
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }),
    );
  }
}

class Plan extends StatefulWidget {
  final UserData userData;

  const Plan({super.key, required this.userData});

  @override
  State<Plan> createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  int? selectedPlan;
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
                "Select a weight loss plan",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 120),

              // ✅ Indicator here
              PageIndicator(
                currentIndex: selectedPlan ?? 0,
                count: 3, // you have 2 cards
              ),

              SizedBox(height: 15),

              SizedBox(
                height: 325,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPlan = 0;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedPlan == 0
                                ? Color(0xff13EC80)
                                : Color(0xffCFE7DB),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 325,
                        width: 280,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                "Relaxed",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Fit sustainable weight loss into your lifestyle with our most lenient plan.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Icon(CupertinoIcons.flame_fill, size: 30),
                                  SizedBox(width: 5),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(text: 'Eat '),
                                        TextSpan(
                                          text: '2.214 calories ',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(text: 'a day'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(CupertinoIcons.arrow_down, size: 30),
                                  SizedBox(width: 5),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(text: 'Lose '),
                                        TextSpan(
                                          text: '0.25KG ',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(text: 'a week'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(CupertinoIcons.calendar, size: 30),
                                  SizedBox(width: 5),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Reach your goal in about  ',
                                        ),
                                        TextSpan(
                                          text: '\n18 Months',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPlan = 1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedPlan == 1
                                ? Color(0xff13EC80)
                                : Color(0xffCFE7DB),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 325,
                        width: 280,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                "Steady",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Lose weight each week with this comfortable yet effective plan",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Icon(CupertinoIcons.flame_fill, size: 30),
                                  SizedBox(width: 5),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(text: 'Eat '),
                                        TextSpan(
                                          text: '1,939 calories ',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(text: 'a day'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(CupertinoIcons.arrow_down, size: 30),
                                  SizedBox(width: 5),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(text: 'Lose '),
                                        TextSpan(
                                          text: '0.5KG ',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(text: 'a week'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(CupertinoIcons.calendar, size: 30),
                                  SizedBox(width: 5),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Reach your goal in about  ',
                                        ),
                                        TextSpan(
                                          text: '\n9 Months',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPlan = 2;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedPlan == 2
                                ? Color(0xff13EC80)
                                : Color(0xffCFE7DB),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 325,
                        width: 280,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                "Steady",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Lose weight each week with this comfortable yet effective plan",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Icon(CupertinoIcons.flame_fill, size: 30),
                                  SizedBox(width: 5),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(text: 'Eat '),
                                        TextSpan(
                                          text: '1,939 calories ',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(text: 'a day'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(CupertinoIcons.arrow_down, size: 30),
                                  SizedBox(width: 5),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(text: 'Lose '),
                                        TextSpan(
                                          text: '0.5KG ',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(text: 'a week'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(CupertinoIcons.calendar, size: 30),
                                  SizedBox(width: 5),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Reach your goal in about  ',
                                        ),
                                        TextSpan(
                                          text: '\n9 Months',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                textAlign: TextAlign.center,
                "Choose the intensity that fits your lifestyle. You can adjust this anytime in your profile settings.",
                style: TextStyle(color: Color(0xff6B7280), fontSize: 16),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
