import 'package:flutter/material.dart';
import 'package:health_app/The%20App/App.dart';
import 'package:health_app/network/auth.dart';
import 'package:health_app/network/injection.dart';
import 'package:health_app/network/my_repo.dart';
import 'package:health_app/profile/Activity.dart';
import 'package:health_app/profile/Age.dart';
import 'package:health_app/profile/Current_Weight.dart';
import 'package:health_app/profile/Gender.dart';
import 'package:health_app/profile/Goal_Weight.dart';
import 'package:health_app/profile/Height.dart';
import 'package:health_app/profile/Plan.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key, required this.email, required this.password});

  final String email;
  final String password;

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  late final MyRepo myrepo;
  late final LoginRequest request;
  late final Future<LoginRespons> respons;

  final PageController _controller = PageController();
  final UserData userData = UserData();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    myrepo = getIt<MyRepo>();
    request = LoginRequest(email: widget.email, password: widget.password);
    respons = myrepo.login(request);
  }

  Future<void> _nextStep() async {
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
      try {
        final loginResponse = await respons;
        final token = loginResponse.token;

        if (token == null || token.isEmpty) {
          throw Exception('Login token is missing');
        }

        final profileRequest = CreateProfileReqest(
          height: userData.height!,
          weight: userData.currentWeight!,
          age: userData.age!,
          gender: userData.gender!,
          activityLevel: userData.activity!,
          goal: userData.goal!,
          targetGainKg: userData.targetGainKG!,
        );
        final createProfileResponse = await myrepo.createProfile(
          token,
          profileRequest,
        );
        if (createProfileResponse.success == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Account created successfully'),
            ),
          );
          if (!mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => App(token: token)),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Error occurred during profile creation: $e'),
          ),
        );
      }

      // Last page → Go to Home
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
                Gender(userData: userData),
                Age(userData: userData),
                Height(userData: userData),
                CurrentWeight(userData: userData),
                GoalWeight(userData: userData),
                Activity(userData: userData),
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

class UserData {
  String? gender;
  int? age;
  int? height;
  int? currentWeight;
  int? goalWeight;
  String? activity;

  // Calculate goal based on current vs goal weight
  String? get goal {
    if (currentWeight == null || goalWeight == null) return null;
    if (currentWeight! > goalWeight!) {
      return 'lose';
    } else if (currentWeight! < goalWeight!) {
      return 'gain';
    } else {
      return 'maintain';
    }
  }

  // Calculate target lose/gain weight
  int? get targetGainKG {
    if (currentWeight == null || goalWeight == null) return null;
    return (currentWeight! - goalWeight!).abs();
  }
}
