import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:health_app/network/auth.dart';
import 'package:health_app/network/my_repo.dart';
import 'package:health_app/network/web_services.dart';
import 'package:health_app/profile/Data.dart';

class Verification extends StatefulWidget {
  final String email;
  const Verification({super.key, this.email = 'user@example.com'});

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

  void handleCodeInput(int index, String value) {
    if (value.isNotEmpty) {
      if (index < 4) {
        focusNodes[index + 1].requestFocus();
      } else {
        focusNodes[index].unfocus();
      }
    }
  }

  String getVerificationCode() {
    return controllers.map((controller) => controller.text).join();
  }

  void onResendTap() {
    setState(() {
      resendCountdown = 45;
      canResend = false;
    });
    startResendTimer();
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
      final myRepo = MyRepo(WebServices(Dio()));
      final response = await myRepo.confirmEmail(request);

      if (!mounted) return;

      if (response.success == true) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Verification successful!')));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Data()),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (index) => _buildOTPField(index)),
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

  Widget _buildOTPField(int index) {
    return Container(
      width: 60,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(
          color: focusNodes[index].hasFocus
              ? Color(0xFF37EC13)
              : Colors.grey[300]!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) => handleCodeInput(index, value),
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black,
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
