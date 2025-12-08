import 'package:flutter/material.dart';

class ModernTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool obscureText;
  final bool hasError;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const ModernTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.hasError = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: hasError 
                    ? Colors.red.withOpacity(0.1)
                    : Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: hasError ? Colors.red.shade300 : Colors.grey[200]!,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: hasError ? Colors.red.shade300 : Colors.grey[200]!,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: hasError ? Colors.red : const Color(0xFF5B5FED),
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.red.shade300, width: 1.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              suffixIcon: suffixIcon,
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
