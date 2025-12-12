import 'package:flutter/material.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Text(
              countryCode,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Container(
            width: 1,
            height: 24,
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
