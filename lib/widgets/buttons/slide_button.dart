import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:auction_ui/themes/app_theme.dart';

class SlideButton extends StatefulWidget {
  final Future<bool> Function()? onSlideComplete;
  final String text;
  final double height;
  final double borderRadius;

  const SlideButton({
    Key? key,
    this.onSlideComplete,
    this.text = 'Slide to Login',
    this.height = 60,
    this.borderRadius = 16,
  }) : super(key: key);

  @override
  State<SlideButton> createState() => _SlideButtonState();
}

class _SlideButtonState extends State<SlideButton>
    with SingleTickerProviderStateMixin {
  double _dragPosition = 0;
  double _maxDrag = 0;
  bool _isCompleted = false;
  bool _isLoading = false;
  late AnimationController _controller;
  late Animation<double> _resetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_isCompleted || _isLoading) return;
    setState(() {
      _dragPosition += details.delta.dx;
      _dragPosition = _dragPosition.clamp(0, _maxDrag);
    });
  }

  void _onDragEnd(DragEndDetails details) async {
    if (_isCompleted || _isLoading) return;

    if (_dragPosition >= _maxDrag * 0.8) {
      setState(() {
        _dragPosition = _maxDrag;
        _isLoading = true;
      });

      final success = await widget.onSlideComplete?.call() ?? false;

      if (success) {
        setState(() {
          _isCompleted = true;
          _isLoading = false;
        });
      } else {
        setState(() => _isLoading = false);
        _resetSlider();
      }
    } else {
      _resetSlider();
    }
  }

  void _resetSlider() {
    final startPosition = _dragPosition;
    _resetAnimation = Tween<double>(begin: startPosition, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    )..addListener(() {
        setState(() => _dragPosition = _resetAnimation.value);
      });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final sliderSize = widget.height - 8;

    return LayoutBuilder(
      builder: (context, constraints) {
        _maxDrag = constraints.maxWidth - sliderSize - 8;

        return ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: widget.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Stack(
                children: [
                  // Progress fill with gradient
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 50),
                    width: _dragPosition + sliderSize + 8,
                    height: widget.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.primaryPurple,
                          AppTheme.primaryTeal.withOpacity(0.8),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                    ),
                  ),
                  // Text
                  Center(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: _isCompleted || _isLoading
                          ? 0
                          : 1 - (_dragPosition / _maxDrag) * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.text,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white.withOpacity(0.9),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Slider thumb with glow
                  Positioned(
                    left: _dragPosition + 4,
                    top: 4,
                    child: GestureDetector(
                      onHorizontalDragUpdate: _onDragUpdate,
                      onHorizontalDragEnd: _onDragEnd,
                      child: Container(
                        width: sliderSize,
                        height: sliderSize,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppTheme.primaryPurple,
                              AppTheme.primaryTeal,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                            widget.borderRadius - 4,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primaryPurple.withOpacity(0.5),
                              blurRadius: 15,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: _isLoading
                            ? const Padding(
                                padding: EdgeInsets.all(12),
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: Colors.white,
                                ),
                              )
                            : Icon(
                                _isCompleted
                                    ? Icons.check
                                    : Icons.chevron_right,
                                color: Colors.white,
                                size: 28,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
