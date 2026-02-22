import 'package:flutter/material.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/button.dart';
import 'package:health_app/auth/Login.dart';
import 'package:health_app/profile/Data.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isPasswordNotVisible1 = true;
  bool isPasswordNotVisible2 = true;
  String? email;
  String? password;
  String? confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          color: Color(0xffF6F8F6),
          child: ListView(
            children: [
              SizedBox(height: 20),

              Text(
                "Start Your Healthy \n Journey",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Full Name',
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

                  prefixIcon: Icon(color: Color(0xff9CA3AF), Icons.person_2),
                  hintStyle: TextStyle(color: Color(0xff9CA3AF)),
                  hintText: 'Mohammed Elgammal',
                ),
              ),
              SizedBox(height: 20),

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
              SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
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
                  password = value;
                },
                obscureText: isPasswordNotVisible1,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff9CA3AF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff37EC13)),
                  ),
                  prefixIcon: Icon(color: Color(0xff9CA3AF), Icons.lock),
                  hintStyle: TextStyle(color: Color(0xff9CA3AF)),
                  hintText: 'Min. 8 characters',
                  suffixIcon: IconButton(
                    icon: Icon(
                      color: Color(0xff9CA3AF),
                      isPasswordNotVisible1
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordNotVisible1 = !isPasswordNotVisible1;
                      });
                    },

                    color: Color(0xff626262),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Conform password',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                  ),
                ),
              ),
              TextField(
                strutStyle: StrutStyle(height: 1.5),

                obscureText: isPasswordNotVisible2,
                onChanged: (value) {
                  confirmPassword = value;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff9CA3AF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff37EC13)),
                  ),
                  prefixIcon: Icon(color: Color(0xff9CA3AF), Icons.lock),
                  hintStyle: TextStyle(color: Color(0xff9CA3AF)),
                  hintText: 'Min. 8 characters',
                  suffixIcon: IconButton(
                    icon: Icon(
                      color: Color(0xff9CA3AF),

                      isPasswordNotVisible2
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordNotVisible2 = !isPasswordNotVisible2;
                      });
                    },

                    color: Color(0xff626262),
                  ),
                ),
              ),
              SizedBox(height: 30),

              Button("Create Account", Data()),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,

                child: Text(
                  "Or Sign up with",
                  style: TextStyle(color: Color(0xff6B7280), fontSize: 12),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 60,
                    width: 160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset("assets/Google.png"),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Google",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 60,
                    width: 160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset("assets/Facebook.png"),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Facebook",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have account?",
                    style: TextStyle(fontSize: 14, color: Color(0xff6B7280)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff37EC13),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff37EC13),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
