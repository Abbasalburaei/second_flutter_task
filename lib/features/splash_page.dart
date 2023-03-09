import 'dart:async';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:second_task/features/home_page.dart';

class SplashPage extends StatefulWidget {
  final int pendingMilliseconds;
  const SplashPage({super.key, this.pendingMilliseconds = 3000});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.pendingMilliseconds),
        value: _progressValue)
      ..addListener(() {
        setState(() {
          _progressValue = _scaleAnimation.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Timer(const Duration(milliseconds: 2000), () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const HomePage()));
          });
        }
      });
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    if (_animationController != null) {
      _animationController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedScale(
          duration: const Duration(milliseconds: 500),
          scale: _progressValue,
          child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Device.screenType == ScreenType.mobile
                    ? Adaptive.w(60)
                    : Adaptive.w(50),
              ),
              child: Image.asset('assets/logo.png', fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
