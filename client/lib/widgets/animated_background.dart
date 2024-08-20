import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedBackground extends StatelessWidget {
  final Widget child;

  const AnimatedBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: AnimatedBackgroundColor()),
        Positioned.fill(child: AnimatedWave()),
        child,
      ],
    );
  }
}

class AnimatedBackgroundColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MirrorAnimationBuilder<Color?>(
      tween: ColorTween(begin: Colors.blue[700], end: Colors.blue[900]),
      duration: const Duration(seconds: 5),
      builder: (context, value, child) {
        return Container(color: value);
      },
    );
  }
}

class AnimatedWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 5),
      builder: (context, value, child) {
        return ClipPath(
          clipper: WaveClipper(value),
          child: Container(color: Colors.white.withOpacity(0.1)),
        );
      },
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double progress;

  WaveClipper(this.progress);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.8);

    final firstControlPoint = Offset(size.width * 0.25, size.height);
    final firstEndPoint = Offset(size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(
      firstControlPoint.dx + (progress * size.width * 0.25),
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    final secondControlPoint = Offset(size.width * 0.75, size.height * 0.6);
    final secondEndPoint = Offset(size.width, size.height * 0.8);
    path.quadraticBezierTo(
      secondControlPoint.dx - (progress * size.width * 0.25),
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}