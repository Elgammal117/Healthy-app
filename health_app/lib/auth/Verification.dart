import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_app/%D8%AD%D9%86%D9%83%D8%B4%D9%87/Maintainence.dart';
import 'dart:async';

import 'package:health_app/network/auth.dart';
import 'package:health_app/network/injection.dart';
import 'package:health_app/network/my_repo.dart';

class Verification extends StatefulWidget {
  final String email;
  final SignUpRequest? signUpRequest;

  const Verification({
    super.key,
    this.email = 'user@example.com',
    this.signUpRequest,
  });

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  late List<FocusNode> focusNodes;
  late List<TextEditingController> controllers;
  int resendCountdown = 45;
  bool canResend = false;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(5, (_) => FocusNode());
    controllers = List.generate(5, (_) => TextEditingController());
    startResendTimer();
  }

  void startResendTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        resendCountdown--;
        if (resendCountdown <= 0) {
          canResend = true;
          timer.cancel();
        }
      });
    });
  }

  String getVerificationCode() {
    return controllers.map((controller) => controller.text).join();
  }

  Future<void> onResendTap() async {
    if (!canResend) return;

    final request = widget.signUpRequest;
    if (request == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Missing signup data. Please sign up again.')),
      );
      return;
    }

    try {
      final myRepo = getIt<MyRepo>();
      final response = await myRepo.signUp(request);

      if (!mounted) return;

      if (response.success == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('A new verification code has been sent.')),
        );
        setState(() {
          resendCountdown = 45;
          canResend = false;
        });
        startResendTimer();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.message ?? 'Failed to resend code.')),
        );
      }
    } on DioException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.response?.data?['message']?.toString() ??
                'Network error. Please try again.',
          ),
        ),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Something went wrong. Please try again.')),
      );
    }
  }

  Future<void> onVerifyTap() async {
    final code = getVerificationCode();
    if (code.length != 5) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please enter all 5 digits')));
      return;
    }

    try {
      final request = OtpRequest(email: widget.email, otp: code);
      final myRepo = getIt<MyRepo>();
      final response = await myRepo.confirmEmail(request);

      if (!mounted) return;

      if (response.success == true) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Verification successful!')));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => UnderMaintenance()),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message ?? 'Invalid code. Please try again.'),
        ),
      );
    } on DioException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.response?.data?['message']?.toString() ??
                'Network error. Please try again.',
          ),
        ),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Something went wrong. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Verification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              // Email Icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFFD4F8EB),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.mail_outline,
                  size: 60,
                  color: Color(0xFF37EC13),
                ),
              ),
              SizedBox(height: 40),
              // Check your email text
              Text(
                'Check your email',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              // Email description
              Text(
                "We've sent a 4-digit code to your email\n${widget.email}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 50),
              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Container(
                    width: 60,
                    height: 70,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: Color(0xffF1F5F9),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xffF1F5F9),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xff37EC13),
                            width: 2,
                          ),
                        ),
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        if (value.length == 1 && index < 4) {
                          focusNodes[index + 1].requestFocus();
                        } else if (value.isEmpty && index > 0) {
                          focusNodes[index - 1].requestFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: 40),
              // Resend Code
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive code? ",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: canResend ? onResendTap : null,
                    child: Text(
                      canResend ? 'Resend' : 'Resend (${resendCountdown}s)',
                      style: TextStyle(
                        color: canResend ? Color(0xFF37EC13) : Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              // Verify & Continue Button
              Container(
                width: double.infinity,
                height: 56,
                margin: EdgeInsets.only(bottom: 32),
                decoration: BoxDecoration(
                  color: Color(0xFF37EC13),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onVerifyTap,
                    borderRadius: BorderRadius.circular(16),
                    child: Center(
                      child: Text(
                        'Verify & Continue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
    countdownTimer?.cancel();
    super.dispose();
  }
}
