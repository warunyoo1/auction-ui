import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/modern_text_field.dart';
import 'widgets/modern_button.dart';
import 'widgets/social_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _hasError = false;
  late TabController _tabController;

  // Sign up controllers
  final TextEditingController _signUpEmailController = TextEditingController();
  final TextEditingController _signUpPasswordController =
      TextEditingController();
  final TextEditingController _signUpConfirmPasswordController =
      TextEditingController();
  final TextEditingController _signUpPhoneController = TextEditingController();
  final TextEditingController _signUpIdCardController =
      TextEditingController();
  final _signUpFormKey = GlobalKey<FormState>();
  bool _signUpObscurePassword = true;
  bool _signUpObscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _signUpEmailController.dispose();
    _signUpPasswordController.dispose();
    _signUpConfirmPasswordController.dispose();
    _signUpPhoneController.dispose();
    _signUpIdCardController.dispose();
    super.dispose();
  }

  void _login() async {
    if (!_formKey.currentState!.validate()) {
      setState(() => _hasError = true);
      return;
    }

    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('เข้าสู่ระบบสำเร็จ')),
      );
    }
  }

  void _signUp() async {
    if (!_signUpFormKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('สมัครสมาชิกสำเร็จ!'),
          backgroundColor: Colors.green,
        ),
      );
      _tabController.animateTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),

              // Tab Bar
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400],
                  labelStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  indicatorColor: Colors.black,
                  indicatorWeight: 2,
                  tabs: const [
                    Tab(text: 'Log in'),
                    Tab(text: 'Sign up'),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Tab Content
              SizedBox(
                height: 600,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildLoginForm(),
                    _buildSignUpForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email Field
            ModernTextField(
              controller: _emailController,
              label: 'Your Email',
              hintText: 'alphainvent@gmail.com',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกอีเมล';
                }
                return null;
              },
            ),

            const SizedBox(height: 24),

            // Password Field
            ModernTextField(
              controller: _passwordController,
              label: 'Password',
              hintText: '••••••••••',
              obscureText: _obscurePassword,
              hasError: _hasError,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey[400],
                ),
                onPressed: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกรหัสผ่าน';
                }
                return null;
              },
            ),

            const SizedBox(height: 12),

            // Error and Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_hasError)
                  const Text(
                    'Wrong password',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  )
                else
                  const SizedBox(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Continue Button
            ModernButton(
              label: 'Continue',
              onPressed: _login,
              isLoading: _isLoading,
            ),

            const SizedBox(height: 32),

            // Divider
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey[300])),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Or',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                Expanded(child: Divider(color: Colors.grey[300])),
              ],
            ),

            const SizedBox(height: 32),

            // Apple Login
            SocialButton(
              label: 'Login with Apple',
              icon: const Icon(Icons.apple, color: Colors.black),
              onPressed: () {},
            ),

            const SizedBox(height: 16),

            // Google Login
            SocialButton(
              label: 'Login with Google',
              icon: Image.network(
                'https://www.google.com/favicon.ico',
                width: 20,
                height: 20,
              ),
              onPressed: () {},
            ),

            const SizedBox(height: 24),

            // Sign up link
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  children: [
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () => _tabController.animateTo(1),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Color(0xFF5B5FED),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
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
      ),
    );
  }

  Widget _buildSignUpForm() {
    return SingleChildScrollView(
      child: Form(
        key: _signUpFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email
            ModernTextField(
              controller: _signUpEmailController,
              label: 'อีเมล',
              hintText: 'example@email.com',
              keyboardType: TextInputType.emailAddress,
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

            // Phone
            ModernTextField(
              controller: _signUpPhoneController,
              label: 'เบอร์โทรศัพท์',
              hintText: '0812345678',
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกเบอร์โทรศัพท์';
                }
                if (value.length < 10) {
                  return 'เบอร์โทรศัพท์ต้องมี 10 หลัก';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            // ID Card
            ModernTextField(
              controller: _signUpIdCardController,
              label: 'เลขบัตรประชาชน',
              hintText: '1234567890123',
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกเลขบัตรประชาชน';
                }
                if (value.length != 13) {
                  return 'เลขบัตรประชาชนต้องมี 13 หลัก';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            // Password
            ModernTextField(
              controller: _signUpPasswordController,
              label: 'รหัสผ่าน',
              hintText: '••••••••',
              obscureText: _signUpObscurePassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _signUpObscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.grey[400],
                ),
                onPressed: () {
                  setState(() {
                    _signUpObscurePassword = !_signUpObscurePassword;
                  });
                },
              ),
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

            const SizedBox(height: 20),

            // Confirm Password
            ModernTextField(
              controller: _signUpConfirmPasswordController,
              label: 'ยืนยันรหัสผ่าน',
              hintText: '••••••••',
              obscureText: _signUpObscureConfirmPassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _signUpObscureConfirmPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.grey[400],
                ),
                onPressed: () {
                  setState(() {
                    _signUpObscureConfirmPassword =
                        !_signUpObscureConfirmPassword;
                  });
                },
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณายืนยันรหัสผ่าน';
                }
                if (value != _signUpPasswordController.text) {
                  return 'รหัสผ่านไม่ตรงกัน';
                }
                return null;
              },
            ),

            const SizedBox(height: 28),

            // Sign Up Button
            ModernButton(
              label: 'สมัครสมาชิก',
              onPressed: _signUp,
              isLoading: _isLoading,
            ),

            const SizedBox(height: 24),

            // Divider
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey[300])),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'หรือสมัครด้วย',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                Expanded(child: Divider(color: Colors.grey[300])),
              ],
            ),

            const SizedBox(height: 24),

            // Google Sign Up
            SocialButton(
              label: 'Sign up with Google',
              icon: Image.network(
                'https://www.google.com/favicon.ico',
                width: 20,
                height: 20,
              ),
              onPressed: () {},
            ),

            const SizedBox(height: 24),

            // Login link
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'มีบัญชีอยู่แล้ว? ',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  children: [
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () => _tabController.animateTo(0),
                        child: const Text(
                          'เข้าสู่ระบบ',
                          style: TextStyle(
                            color: Color(0xFF5B5FED),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
