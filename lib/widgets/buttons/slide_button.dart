import 'package:flutter/material.dart';

class SlideButton extends StatefulWidget {
  final Future<bool> Function()? onSlideComplete;
  final String text;
  final Color backgroundColor;
  final Color sliderColor;
  final double height;
  final double borderRadius;

  const SlideButton({
    Key? key,
    this.onSlideComplete,
    this.text = 'Slide to Login',
    this.backgroundColor = const Color(0xFFE8D5F9),
    this.sliderColor = const Color(0xFF9C27B0),
    this.height = 56,
    this.borderRadius = 30,
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

      // Call onSlideComplete and check result
      final success = await widget.onSlideComplete?.call() ?? false;

      if (success) {
        setState(() {
          _isCompleted = true;
          _isLoading = false;
        });
      } else {
        // Login failed, reset slider
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

        return Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Stack(
            children: [
              // Progress fill
              AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                width: _dragPosition + sliderSize + 8,
                height: widget.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      widget.sliderColor,
                      widget.sliderColor.withValues(alpha: 0.7),
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
                          color: _dragPosition > _maxDrag * 0.3
                              ? Colors.white
                              : widget.sliderColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        color: _dragPosition > _maxDrag * 0.3
                            ? Colors.white
                            : widget.sliderColor,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              // Slider thumb
              Positioned(
                left: _dragPosition + 4,
                top: 4,
                child: GestureDetector(
                  onHorizontalDragUpdate: _onDragUpdate,
                  onHorizontalDragEnd: _onDragEnd,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    width: sliderSize,
                    height: sliderSize,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(widget.borderRadius - 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: _isLoading
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: widget.sliderColor,
                            ),
                          )
                        : Icon(
                            _isCompleted ? Icons.check : Icons.chevron_right,
                            color: widget.sliderColor,
                            size: 28,
                          ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
