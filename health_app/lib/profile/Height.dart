import 'package:flutter/material.dart';

class Height extends StatefulWidget {
  const Height({super.key});

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {
  final ScrollController _controller = ScrollController();

  int minHeight = 100; // cm
  int maxHeight = 250; // cm

  double itemWidth = 15;

  int currentHeight = 170; // cm, default

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToHeight(currentHeight);
    });

    _controller.addListener(_onScroll);
  }

  void _scrollToHeight(int height) {
    if (!_controller.hasClients) return;
    final viewportWidth = _controller.position.viewportDimension;
    double offset =
        (height - minHeight) * itemWidth - viewportWidth / 2 + itemWidth / 2;
    offset = offset.clamp(0.0, _controller.position.maxScrollExtent);
    _controller.jumpTo(offset);
  }

  void _onScroll() {
    if (!_controller.hasClients) return;
    final centerOffset =
        _controller.offset + _controller.position.viewportDimension / 2;
    int index = (centerOffset / itemWidth).round();
    int height = (minHeight + index).clamp(minHeight, maxHeight);

    if (height != currentHeight) {
      setState(() {
        currentHeight = height;
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
              "What is your height?",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 150),
            Text(
              "Your height",
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
                    "$currentHeight",
                    style: const TextStyle(
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 50),
                    child: Text(
                      "cm",
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
                  ListView.builder(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: (maxHeight - minHeight + 1),
                    itemBuilder: (context, index) {
                      bool isMajor = (minHeight + index) % 10 == 0;
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
              "Your height helps us calculate your daily calorie and macro needs more accurately.",
              style: TextStyle(color: Color(0xff6B7280), fontSize: 12),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
