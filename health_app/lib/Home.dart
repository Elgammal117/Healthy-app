import 'package:flutter/material.dart';
import 'package:health_app/Login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();
  int currentPage = 0;
  void _nextStep() {
    if (currentPage < 4) {
      setState(() {
        currentPage++;
      });

      _controller.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
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
              children: List.generate(6, (index) {
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

              children: [Login()],
            ),
          ),

          // 🔹 Button
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(onPressed: _nextStep, child: Text("Next")),
          ),
        ],
      ),
    );
  }
}
