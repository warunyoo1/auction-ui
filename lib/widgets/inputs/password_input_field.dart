import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool showForgot;
  final VoidCallback? onForgotPressed;
  final String? Function(String?)? validator;

  const PasswordInputField({
    Key? key,
    required this.controller,
    this.hintText = 'Password',
    this.showForgot = false,
    this.onForgotPressed,
    this.validator,
  }) : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child:
                Icon(Icons.lock_outline, color: Colors.grey.shade500, size: 22),
          ),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(color: Colors.grey.shade400),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              ),
              validator: widget.validator,
            ),
          ),
          if (widget.showForgot)
            TextButton(
              onPressed: widget.onForgotPressed,
              child: const Text(
                'FORGOT',
                style: TextStyle(
                  color: Color(0xFF9C27B0),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            )
          else
            IconButton(
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Colors.grey.shade500,
              ),
              onPressed: () =>
                  setState(() => _obscurePassword = !_obscurePassword),
            ),
        ],
      ),
    );
  }
}
