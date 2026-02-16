import 'package:flutter/material.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/button.dart';
import 'package:health_app/profile/Age.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  int? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F4F6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Tell us about \n yourself",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 12),
            Text(
              "We use your gender to calculate your daily calories and macronutrient needs more accurately",
              style: TextStyle(fontSize: 16, color: Color(0xff4A5F54)),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: selectedGender == 0
                            ? Color(0xff13EC80)
                            : Colors.black,
                        width: 2,
                      ),
                    ),
                    height: 250,
                    width: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          size: 50,
                          Icons.male,
                          color: selectedGender == 0
                              ? Color(0xff13EC80)
                              : Colors.black,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Male",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: selectedGender == 1
                            ? Color(0xff13EC80)
                            : Colors.black,
                        width: 2,
                      ),
                    ),
                    height: 250,
                    width: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          size: 50,
                          Icons.female,
                          color: selectedGender == 1
                              ? Color(0xff13EC80)
                              : Colors.black,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Female",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = 2;
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 170,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedGender == 2
                        ? Color(0xff13EC80)
                        : Colors.white,
                    width: 3,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: Text(
                  "Prefer not to say",
                  style: TextStyle(
                    color: Color(0xff4B5563),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              textAlign: TextAlign.center,
              "By continuing you agree to our Terms of Seervice and privacy Policy",
              style: TextStyle(color: Color(0xff6B7280), fontSize: 12),
            ),
            SizedBox(height: 20),
            Button("Continue", Age()),
          ],
        ),
      ),
    );
  }
}
