import 'package:flutter/material.dart';
import 'package:health_app/auth/otp_reset_pass.dart';
import 'package:health_app/network/auth.dart';
import 'package:health_app/network/injection.dart';
import 'package:health_app/network/my_repo.dart';

// ignore: must_be_immutable
class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: SizedBox(
                      height: 256,
                      width: 256,
                      child: Image.asset("assets/chef.png", fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(height: 30),

                  Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.center,
                    "Enter the email address associated with your account and we will send you a link to reset your password",
                    style: TextStyle(fontSize: 16, color: Color(0xff58645E)),
                  ),
                  SizedBox(height: 60),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                      ),
                    ),
                  ),

                  TextField(
                    strutStyle: StrutStyle(height: 1.5),

                    onChanged: (value) {
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xff9CA3AF)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xff37EC13)),
                      ),
                      prefixIcon: Icon(color: Color(0xff9CA3AF), Icons.email),
                      hintStyle: TextStyle(color: Color(0xff9CA3AF)),
                      hintText: 'example@gmail.com',
                    ),
                  ),
                  SizedBox(height: 30),

                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff37EC13),
                    ),
                    height: 65,
                    child: TextButton(
                      onPressed: () async {
                        if (email == null || email!.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter your email address'),
                            ),
                          );
                          return;
                        }
                        try {
                          final request = ForgetPassRequest(email: email!);
                          final myRepo = getIt<MyRepo>();
                          final response = await myRepo.forgetPassword(request);
                          if (response.success == true) {
                            SnackBar(content: Text('otp sent to your email'));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    OtpResetPass(email: email!),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  response.message ??
                                      'Failed to send reset link',
                                ),
                              ),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                'Error occurred during password reset: $e',
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Send',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
