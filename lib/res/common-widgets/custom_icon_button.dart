import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({required this.onTap, required this.icon, super.key});
  final Widget icon;
  final Function onTap;

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  int duration = 200;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: duration),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onIconButtonPressed() {
    // Trigger the scale animation when the icon button is pressed
    _animationController
        .forward(from: 0.0)
        .then((value) => _animationController.animateBack(0.0));
    Future.delayed(Duration(milliseconds: duration * 2), () {
      widget.onTap.call();
    });
    // Add your icon button's functionality here
    // For example, navigate to a new screen, toggle a state, etc.
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTap: _onIconButtonPressed,
            child: SizedBox(
                width: 30,
                child: widget.icon),
          ),
        );
      },
    );
  }
}
