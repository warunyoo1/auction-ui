import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1a1a2e), // Deep dark blue
            Color(0xFF16213e), // Dark navy
            Color(0xFF0f3460), // Deep blue
          ],
        ),
      ),
      child: SafeArea(
        child: child,
      ),
    );
  }
}
