import 'package:flutter/material.dart';
import 'package:auction_ui/themes/app_theme.dart';
import 'package:auction_ui/widgets/gradient_background.dart';
import 'package:auction_ui/widgets/phone_input_field.dart';
import 'package:auction_ui/widgets/password_input_field.dart';
import 'package:auction_ui/widgets/social_login_buttons.dart';
import 'package:auction_ui/widgets/page_transitions.dart';
import 'package:auction_ui/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        FadeScalePageRoute(page: const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 180),
                    Text('Register', style: AppTheme.headingLarge),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade600),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Text('sign in', style: AppTheme.linkText),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    // Name field
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Icon(Icons.person_outline,
                                color: Colors.grey.shade500, size: 22),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                hintText: 'Full Name',
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 16),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    PhoneInputField(
                      controller: _phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    PasswordInputField(
                      controller: _passwordController,
                      hintText: 'Password',
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    PasswordInputField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm Password',
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF9C27B0),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Register',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            SizedBox(width: 8),
                            Icon(Icons.person_add, size: 20),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const SocialLoginButtons(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
