import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  final VoidCallback? onApplePressed;
  final VoidCallback? onFacebookPressed;
  final VoidCallback? onGooglePressed;
  final VoidCallback? onTwitterPressed;

  const SocialLoginButtons({
    Key? key,
    this.onApplePressed,
    this.onFacebookPressed,
    this.onGooglePressed,
    this.onTwitterPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialButton(
          icon: Icons.apple,
          color: Colors.black,
          onPressed: onApplePressed,
        ),
        const SizedBox(width: 24),
        _SocialButton(
          icon: Icons.facebook,
          color: const Color(0xFF1877F2),
          onPressed: onFacebookPressed,
        ),
        const SizedBox(width: 24),
        _GoogleButton(onPressed: onGooglePressed),
        const SizedBox(width: 24),
        _SocialButton(
          icon: Icons.flutter_dash,
          color: const Color(0xFF1DA1F2),
          onPressed: onTwitterPressed,
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onPressed;

  const _SocialButton({
    required this.icon,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}

class _GoogleButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const _GoogleButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        child: const Center(
          child: Text(
            'G',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
