import 'package:flutter/material.dart';
import 'package:health_app/The%20App/Meal_Complete.dart';

class Steps extends StatefulWidget {
  final String token;
  final String name;
  final List<dynamic> steps;
  final String foodId;

  const Steps({
    super.key,
    required this.foodId,
    required this.token,
    required this.steps,
    required this.name,
  });

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goBack(BuildContext context) {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  void _goNext(BuildContext context) {
    if (widget.steps.isEmpty) return;

    if (_currentPage < widget.steps.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            MealCompletedScreen(token: widget.token, foodId: widget.foodId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBF7),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FBF7),
        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),

        title: Text(
          widget.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),

        centerTitle: true,
      ),

      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          int currentpage = index + 1;
          return step(
            steps: widget.steps,
            currentStep: currentpage,
            description: widget.steps[index].description ?? "",
          );
        },
        itemCount: widget.steps.length,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
          ],
        ),

        child: Row(
          children: [
            // Back
            Expanded(
              child: OutlinedButton.icon(
                onPressed: widget.steps.isEmpty ? null : () => _goBack(context),

                icon: const Icon(Icons.arrow_back),

                label: const Text("Back"),

                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  side: BorderSide(color: Colors.grey.shade300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 15),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: widget.steps.isEmpty ? null : () => _goNext(context),

                icon: const Text(""),

                label: const Text("Next Step →"),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff37EC13),
                  foregroundColor: Colors.white,

                  padding: const EdgeInsets.symmetric(vertical: 15),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            // Next
          ],
        ),
      ),
    );
  }
}

class step extends StatefulWidget {
  final List<dynamic> steps;
  final int currentStep;
  final String description;

  const step({
    super.key,
    required this.steps,
    required this.currentStep,
    required this.description,
  });

  @override
  State<step> createState() => _stepState();
}

class _stepState extends State<step> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Step ${widget.currentStep} of ${widget.steps.length}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: (widget.currentStep) / (widget.steps.length),
                  minHeight: 8,
                  backgroundColor: Colors.green.shade100,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        // Scrollable Content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Step ${widget.currentStep}",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Macro Card
                  const SizedBox(height: 20),

                  // Timer Button
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),

        // Bottom Buttons
      ],
    );
  }
}
