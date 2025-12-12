import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color backgroundColor;
  final Color hoverColor;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  const HoverButton({
    Key? key,
    this.onPressed,
    required this.child,
    required this.backgroundColor,
    required this.hoverColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
  }) : super(key: key);

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton>
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
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
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
                borderRadius: widget.borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: widget.hoverColor
                        .withValues(alpha: _isPressed ? 0.6 : 0.3),
                    blurRadius: _isPressed ? 12 : 6,
                    offset: Offset(0, _isPressed ? 6 : 3),
                  ),
                ],
              ),
              child: Material(
                color: _isPressed ? widget.hoverColor : widget.backgroundColor,
                borderRadius: widget.borderRadius,
                child: Padding(
                  padding: widget.padding,
                  child: widget.child,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
