import 'package:animation_example/custom_clipper.dart';
import 'package:flutter/material.dart';



///This is the container on which the animation is implemented

class AnimatedCornerBox extends StatefulWidget {
  const AnimatedCornerBox({super.key, this.isLeftCorner = false});
  final bool isLeftCorner;
  @override
  AnimatedCornerBoxState createState() => AnimatedCornerBoxState();
}

class AnimatedCornerBoxState extends State<AnimatedCornerBox> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 40.0).animate(_animationController!)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCornerClipper(_animation!.value,isLeftCorner: widget.isLeftCorner),
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(_animation!.value + 8),
        ),
      ),
    );
  }
}