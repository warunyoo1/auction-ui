import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:auction_ui/themes/app_theme.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final String countryCode;
  final String? Function(String?)? validator;

  const PhoneInputField({
    Key? key,
    required this.controller,
    this.countryCode = '+66',
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Text(
                  countryCode,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 24,
                color: Colors.white.withOpacity(0.2),
              ),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: AppTheme.primaryTeal,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    hintText: 'Phone number',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
                  ),
                  validator: validator,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
