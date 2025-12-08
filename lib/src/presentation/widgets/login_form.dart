import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final VoidCallback onLogin;
  final VoidCallback onForgotPassword;

  const LoginForm({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.isLoading,
    required this.onLogin,
    required this.onForgotPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.1),
            Colors.white.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 40,
            offset: const Offset(0, 20),
            spreadRadius: -5,
          ),
          BoxShadow(
            color: const Color(0xFF00d4ff).withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(-10, -10),
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            // Email Field
            CustomTextField(
              controller: emailController,
              labelText: 'อีเมล',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกอีเมล';
                }
                if (!value.contains('@')) {
                  return 'กรุณากรอกอีเมลที่ถูกต้อง';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Password Field
            CustomTextField(
              controller: passwordController,
              labelText: 'รหัสผ่าน',
              prefixIcon: Icons.lock_outline,
              textInputAction: TextInputAction.done,
              isPassword: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกรหัสผ่าน';
                }
                if (value.length < 6) {
                  return 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),

            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onForgotPassword,
                child: Text(
                  'ลืมรหัสผ่าน?',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Login Button
            SizedBox(
              width: double.infinity,
              height: 58,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF00d4ff), // Cyan
                      Color(0xFF0099ff), // Blue
                    ],
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00d4ff).withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: isLoading ? null : onLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          'เข้าสู่ระบบ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
