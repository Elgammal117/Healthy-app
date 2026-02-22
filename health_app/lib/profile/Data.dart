import 'package:flutter/material.dart';
import 'package:health_app/The%20App/App.dart';
import 'package:health_app/profile/Activity.dart';
import 'package:health_app/profile/Age.dart';
import 'package:health_app/profile/Current_Weight.dart';
import 'package:health_app/profile/Gender.dart';
import 'package:health_app/profile/Goal_Weight.dart';
import 'package:health_app/profile/Height.dart';
import 'package:health_app/profile/Plan.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  final PageController _controller = PageController();
  int currentPage = 0;
  void _nextStep() {
    if (currentPage < 6) {
      // Still inside PageView
      setState(() {
        currentPage++;
      });

      _controller.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Last page → Go to Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const App()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(7, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: 6,
                  width: 24,
                  decoration: BoxDecoration(
                    color: currentPage >= index
                        ? Colors.green
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _controller,

              // 🚫 Disable Swipe
              physics: NeverScrollableScrollPhysics(),

              children: [
                Gender(),
                Age(),
                Height(),
                CurrentWeight(),
                GoalWeight(),
                Activity(),
                Plan(),
              ],
            ),
          ),

          // 🔹 Button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff37EC13),
              ),
              height: 65,
              child: TextButton(
                onPressed: _nextStep,
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
