import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String label;
  final String? iconUrl;
  final IconData? fallbackIcon;
  final VoidCallback onPressed;

  const SocialLoginButton({
    Key? key,
    required this.label,
    this.iconUrl,
    this.fallbackIcon = Icons.login,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          icon: iconUrl != null
              ? Image.network(
                  iconUrl!,
                  width: 24,
                  height: 24,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(fallbackIcon, size: 24);
                  },
                )
              : Icon(fallbackIcon, size: 24),
          label: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
