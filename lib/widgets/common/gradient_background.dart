import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFD8B5F5),
            Color(0xFFDCBDF6),
            Color(0xFFE0C5F7),
            Color(0xFFE4CDF8),
            Color(0xFFE8D5F9),
            Color(0xFFEDDDFA),
            Color(0xFFF1E5FB),
            Color(0xFFF5EDFC),
            Color(0xFFF9F5FD),
            Color(0xFFFCFAFE),
            Colors.white,
          ],
          stops: [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0],
        ),
      ),
      child: child,
    );
  }
}
