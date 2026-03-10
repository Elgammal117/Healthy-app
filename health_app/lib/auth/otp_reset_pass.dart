import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_app/auth/ResetPassword.dart';
import 'package:health_app/network/auth.dart';
import 'package:health_app/network/injection.dart';
import 'package:health_app/network/my_repo.dart';

class OtpResetPass extends StatefulWidget {
  final String? email;
  const OtpResetPass({super.key, this.email});

  @override
  State<OtpResetPass> createState() => _OtpResetPassState();
}

class _OtpResetPassState extends State<OtpResetPass> {
  final List<TextEditingController> _controllers = List.generate(
    5,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(5, (index) => FocusNode());

  int _remainingSeconds = 59;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _canResend = false;
    _remainingSeconds = 59;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _canResend = true;
          _timer?.cancel();
        }
      });
    });
  }

  void _resendCode() {
    if (_canResend) {
      // TODO: Implement resend code API call
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Code resent to ${widget.email ?? "your email"}'),
        ),
      );
      _startTimer();
    }
  }

  String _getOtpCode() {
    return _controllers.map((controller) => controller.text).join();
  }

  Future<void> _verifyCode() async {
    String otp = _getOtpCode();
    if (otp.length != 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter the complete 5-digit code')),
      );
      return;
    } else {
      try {
        final myRepo = getIt<MyRepo>();
        final response = await myRepo.otpVerify(
          OtpVerifyreq(email: widget.email!, otp: otp),
        );
        if (response.success == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Account verified successfully. You can now reset your password.',
              ),
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResetPassword(email: widget.email!),
            ),
          );
          return;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message ?? 'Failed to resend code.'),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Error occurred while verifying code: $e'),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
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
          'Reset Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: 40),

                // Icon
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffC8F4C0),
                  ),
                  child: Center(
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Icon(
                        Icons.lock_reset,
                        size: 60,
                        color: Color(0xff37EC13),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 60),

                // Title
                Text(
                  'Enter the 5-digit code',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 12),

                // Description
                Text(
                  'Enter the 5-digit code sent to your email to\nreset your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff94A3B8),
                    height: 1.5,
                  ),
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
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          if (value.length == 1 && index < 4) {
                            _focusNodes[index + 1].requestFocus();
                          } else if (value.isEmpty && index > 0) {
                            _focusNodes[index - 1].requestFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),

                SizedBox(height: 30),

                // Timer and Resend
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Resend Code in ',
                      style: TextStyle(fontSize: 14, color: Color(0xff94A3B8)),
                    ),
                    Text(
                      '00:${_remainingSeconds.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontSize: 14,
                        color: _canResend
                            ? Color(0xff94A3B8)
                            : Color(0xff37EC13),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8),

                GestureDetector(
                  onTap: _resendCode,
                  child: Text(
                    'Resend now',
                    style: TextStyle(
                      fontSize: 14,
                      color: _canResend ? Color(0xff37EC13) : Color(0xff94A3B8),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(height: 100),

                // Verify Button
                Container(
                  width: double.infinity,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff37EC13),
                  ),
                  child: TextButton(
                    onPressed: _verifyCode,
                    child: Text(
                      'Verify Code',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Footer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.restaurant_menu,
                      size: 16,
                      color: Color(0xff94A3B8),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'PREMIUM COOKBOOK APP',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff94A3B8),
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
