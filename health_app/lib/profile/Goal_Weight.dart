import 'package:flutter/material.dart';
import 'package:health_app/profile/Data.dart';

class GoalWeight extends StatefulWidget {
  final UserData userData;

  const GoalWeight({super.key, required this.userData});

  @override
  State<GoalWeight> createState() => _GoalWeightState();
}

class _GoalWeightState extends State<GoalWeight> {
  final ScrollController _controller = ScrollController();

  int minWeight = 40; // kg
  int maxWeight = 200; // kg

  double itemWidth = 15;

  int goalWeight = 65; // kg, default

  @override
  void initState() {
    super.initState();

    // Set initial default value
    widget.userData.goalWeight = goalWeight;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToWeight(goalWeight);
    });

    _controller.addListener(_onScroll);
  }

  void _scrollToWeight(int weight) {
    if (!_controller.hasClients) return;
    double offset = (weight - minWeight) * itemWidth;
    offset = offset.clamp(0.0, _controller.position.maxScrollExtent);
    _controller.jumpTo(offset);
  }

  void _onScroll() {
    if (!_controller.hasClients) return;
    int index = (_controller.offset / itemWidth).round();
    int weight = (minWeight + index).clamp(minWeight, maxWeight);

    if (weight != goalWeight) {
      setState(() {
        goalWeight = weight;
        widget.userData.goalWeight = weight;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F4F6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "What is your goal weight?",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 150),
            Text(
              "Your goal weight",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff64748B),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$goalWeight",
                    style: const TextStyle(
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 50),
                    child: Text(
                      "kg",
                      style: TextStyle(
                        color: Color(0xff13EC80),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final padding = constraints.maxWidth / 2;
                      return ListView.builder(
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        itemCount: (maxWeight - minWeight + 1),
                        itemBuilder: (context, index) {
                          bool isMajor = (minWeight + index) % 10 == 0;
                          return Container(
                            width: itemWidth,
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 2,
                              height: isMajor ? 35 : 20,
                              color: Colors.grey.shade400,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  // CENTER LINE
                  Container(width: 3, height: 40, color: Colors.green),
                ],
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Slide the ruler to adjust",
              style: TextStyle(color: Color(0xff94A3B8), fontSize: 14),
            ),
            Spacer(),
            Text(
              textAlign: TextAlign.center,
              "Your goal weight helps us personalize your calorie and macro targets.",
              style: TextStyle(color: Color(0xff6B7280), fontSize: 12),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
