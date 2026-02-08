import 'package:flutter/material.dart';

class Age extends StatefulWidget {
  const Age({super.key});

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  final ScrollController _controller = ScrollController();

  int minAge = 18;
  int maxAge = 100;

  double itemWidth = 15;

  int currentAge = 28;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToAge(currentAge);
    });

    _controller.addListener(_onScroll);
  }

  void _scrollToAge(int age) {
    if (!_controller.hasClients) return;
    final viewportWidth = _controller.position.viewportDimension;
    double offset =
        (age - minAge) * itemWidth - viewportWidth / 2 + itemWidth / 2;
    offset = offset.clamp(0.0, _controller.position.maxScrollExtent);
    _controller.jumpTo(offset);
  }

  void _onScroll() {
    if (!_controller.hasClients) return;
    final centerOffset =
        _controller.offset + _controller.position.viewportDimension / 2;
    int index = (centerOffset / itemWidth).round();
    int age = (minAge + index).clamp(minAge, maxAge);

    if (age != currentAge) {
      setState(() {
        currentAge = age;
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
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),

              Text(
                "How old are you?",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 150),
              Text(
                "Current age",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff64748B),
                ),
              ),
              Text(
                currentAge.toString(),
                style: const TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
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

                      itemCount: (maxAge - minAge + 1),

                      itemBuilder: (context, index) {
                        bool isMajor = index % 5 == 0;

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
                "Your age helps us calculate your daily metabolic rate and macro needs with precision.",
                style: TextStyle(color: Color(0xff6B7280), fontSize: 12),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
