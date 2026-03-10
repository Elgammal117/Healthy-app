import 'package:flutter/material.dart';
import 'package:health_app/network/auth.dart';
import 'package:health_app/network/injection.dart';
import 'package:health_app/network/my_repo.dart';

class ResetPassword extends StatefulWidget {
  final String? email;
  const ResetPassword({super.key, this.email});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isPasswordNotVisible1 = true;
  bool isPasswordNotVisible2 = true;
  String? newPassword;
  String? confirmPassword;

  // Password validation states
  bool hasMinLength = false;
  bool hasNumberOrSymbol = false;
  bool hasUppercase = false;

  void validatePassword(String password) {
    setState(() {
      hasMinLength = password.length >= 8;
      hasNumberOrSymbol = RegExp(
        r'[0-9!@#\$%^&*(),.?":{}|<>_\-+=~`/\\\[\]]',
      ).hasMatch(password);
      hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    });
  }

  bool get isStrongPassword =>
      hasMinLength && hasNumberOrSymbol && hasUppercase;

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
          'Security',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(height: 20),

          // Title
          Text(
            "Create New Password",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12),

          // Description
          Text(
            "Your new password must be different from previously used passwords. Use a mix of characters for better security.",
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff64748B),
              height: 1.5,
            ),
          ),
          SizedBox(height: 32),

          // New Password Label
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'New Password',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff1E293B),
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 8),

          // New Password Field
          TextField(
            strutStyle: StrutStyle(height: 1.5),
            onChanged: (value) {
              newPassword = value;
              validatePassword(value);
            },
            obscureText: isPasswordNotVisible1,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Color(0xffE2E8F0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Color(0xff37EC13), width: 1.5),
              ),
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(color: Color(0xff94A3B8)),
              hintText: 'Enter your new password',
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordNotVisible1
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Color(0xff94A3B8),
                ),
                onPressed: () {
                  setState(() {
                    isPasswordNotVisible1 = !isPasswordNotVisible1;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 8),

          // Password Strength Indicator
          if (newPassword != null && newPassword!.isNotEmpty)
            Text(
              isStrongPassword ? 'Strong password' : 'Weak password',
              style: TextStyle(
                fontSize: 14,
                color: isStrongPassword ? Color(0xff22C55E) : Color(0xffEF4444),
                fontWeight: FontWeight.w600,
              ),
            ),
          SizedBox(height: 24),

          // Confirm Password Label
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Confirm New Password',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff1E293B),
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 8),

          // Confirm Password Field
          TextField(
            strutStyle: StrutStyle(height: 1.5),
            onChanged: (value) {
              confirmPassword = value;
            },
            obscureText: isPasswordNotVisible2,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Color(0xffE2E8F0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Color(0xff37EC13), width: 1.5),
              ),
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(color: Color(0xff94A3B8)),
              hintText: 'Re-enter your new password',
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordNotVisible2
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Color(0xff94A3B8),
                ),
                onPressed: () {
                  setState(() {
                    isPasswordNotVisible2 = !isPasswordNotVisible2;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 24),

          // Validation Rules
          _buildValidationRule('At least 8 characters', hasMinLength),
          SizedBox(height: 12),
          _buildValidationRule(
            'Contains a number or symbol',
            hasNumberOrSymbol,
          ),
          SizedBox(height: 12),
          _buildValidationRule('One uppercase letter', hasUppercase),
          SizedBox(height: 80),

          // Update Password Button
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Color(0xff37EC13),
            ),
            child: TextButton(
              onPressed: () async {
                if (newPassword == null || newPassword!.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a new password')),
                  );
                  return;
                }

                if (!isStrongPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please meet all password requirements'),
                    ),
                  );
                  return;
                }

                if (newPassword != confirmPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Passwords do not match')),
                  );
                  return;
                } else {
                  try {
                    final request = ResetPassReq(
                      email: widget.email!,
                      newPassword: newPassword!,
                    );
                    final repo = getIt<MyRepo>();
                    final response = await repo.resetPassword(request);

                    if (response.success == true) {
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            response.message ?? 'Password reset failed',
                          ),
                        ),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Error occurred during reset password'),
                      ),
                    );
                  }
                }
              },
              child: Text(
                'Update Password',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),

          // Contact Support
          Center(
            child: RichText(
              text: TextSpan(
                text: 'Having trouble? ',
                style: TextStyle(fontSize: 15, color: Color(0xff64748B)),
                children: [
                  TextSpan(
                    text: 'Contact Support',
                    style: TextStyle(
                      color: Color(0xff37EC13),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xff37EC13),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildValidationRule(String label, bool isValid) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isValid ? Color(0xff22C55E) : Colors.transparent,
            border: Border.all(
              color: isValid ? Color(0xff22C55E) : Color(0xffCBD5E1),
              width: 2,
            ),
          ),
          child: isValid
              ? Icon(Icons.check, color: Colors.white, size: 14)
              : null,
        ),
        SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            color: Color(0xff64748B),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
