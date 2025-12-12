import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLoginButtons extends StatelessWidget {
  final VoidCallback? onGooglePressed;
  final VoidCallback? onFacebookPressed;

  const SocialLoginButtons({
    Key? key,
    this.onGooglePressed,
    this.onFacebookPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TapSocialButton(
          onPressed: onGooglePressed,
          icon: Image.network(
            'https://www.google.com/favicon.ico',
            width: 20,
            height: 20,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.g_mobiledata, size: 24, color: Colors.red),
          ),
          label: 'Sign in with Google',
          backgroundColor: Colors.white,
          pressedColor: Colors.grey.shade200,
          textColor: Colors.black87,
          hasBorder: true,
        ),
        const SizedBox(height: 12),
        _TapSocialButton(
          onPressed: onFacebookPressed,
          icon: const FaIcon(FontAwesomeIcons.facebookF,
              color: Colors.white, size: 20),
          label: 'Sign in with Facebook',
          backgroundColor: const Color(0xFF1877F2),
          pressedColor: const Color(0xFF145DBF),
          textColor: Colors.white,
        ),
      ],
    );
  }
}

class _TapSocialButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final String label;
  final Color backgroundColor;
  final Color pressedColor;
  final Color textColor;
  final bool hasBorder;

  const _TapSocialButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.pressedColor,
    required this.textColor,
    this.hasBorder = false,
  });

  @override
  State<_TapSocialButton> createState() => _TapSocialButtonState();
}

class _TapSocialButtonState extends State<_TapSocialButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _controller.reverse();
    widget.onPressed?.call();
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: _isPressed
                    ? [
                        BoxShadow(
                          color: widget.pressedColor.withValues(alpha: 0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: Material(
                color:
                    _isPressed ? widget.pressedColor : widget.backgroundColor,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: widget.hasBorder
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: _isPressed
                                ? Colors.grey.shade400
                                : Colors.grey.shade300,
                          ),
                        )
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.icon,
                      const SizedBox(width: 12),
                      Text(
                        widget.label,
                        style: TextStyle(
                          color: widget.textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
