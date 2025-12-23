import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:auction_ui/themes/app_theme.dart';
import 'package:auction_ui/widgets/common/gradient_background.dart';
import 'package:auction_ui/widgets/inputs/phone_input_field.dart';
import 'package:auction_ui/widgets/inputs/password_input_field.dart';
import 'package:auction_ui/widgets/buttons/social_login_buttons.dart';
import 'package:auction_ui/widgets/buttons/slide_button.dart';
import 'package:auction_ui/widgets/common/page_transitions.dart';
import 'package:auction_ui/pages/register_page.dart';
import 'package:auction_ui/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<bool> _login() async {
    if (_formKey.currentState!.validate()) {
      await Future.delayed(const Duration(milliseconds: 500));

      if (mounted) {
        Navigator.pushReplacement(
          context,
          FadeScalePageRoute(page: const HomePage()),
        );
      }
      return true;
    }
    return false;
  }

  void _navigateToHome(int tabIndex) {
    Navigator.push(
      context,
      FadeScalePageRoute(page: HomePage(initialIndex: tabIndex)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              border: Border(
                top: BorderSide(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: 2,
              onTap: (index) {
                if (index == 0) {
                  _navigateToHome(0);
                } else if (index == 1) {
                  _navigateToHome(1);
                }
              },
              selectedItemColor: AppTheme.primaryTeal,
              unselectedItemColor: Colors.white.withOpacity(0.5),
              backgroundColor: Colors.transparent,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'หน้าหลัก',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_outlined),
                  activeIcon: Icon(Icons.notifications),
                  label: 'แจ้งเตือน',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.login_outlined),
                  activeIcon: Icon(Icons.login),
                  label: 'เข้าสู่ระบบ',
                ),
              ],
            ),
          ),
        ),
      ),
      body: GradientBackground(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenHeight * 0.12),
                          // Logo/Brand
                          Center(
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                gradient: AppTheme.primaryGradient,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppTheme.primaryPurple.withOpacity(0.4),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.gavel_rounded,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.06),
                          Text('Welcome Back', style: AppTheme.headingLarge),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  SlidePageRoute(page: const RegisterPage()),
                                ),
                                child:
                                    Text('Sign up', style: AppTheme.linkText),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
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
                            showForgot: true,
                            onForgotPressed: () {},
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 40),
                          SlideButton(
                            text: 'Slide to Login',
                            onSlideComplete: _login,
                          ),
                          const SizedBox(height: 40),
                          const SocialLoginButtons(),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
