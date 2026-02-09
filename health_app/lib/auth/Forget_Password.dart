import 'package:flutter/material.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/button.dart';
import 'package:health_app/auth/Login.dart';

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
                    borderRadius: BorderRadiusGeometry.circular(999),
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
                    "Enter the email address associated with your account and we will send youa link to reset yor password",
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

                  Button("Send Reset Link", Login()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
