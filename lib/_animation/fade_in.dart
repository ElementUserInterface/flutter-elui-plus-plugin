import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  final Widget child;
  final int duration;
  final dynamic listener;
  final dynamic autoPlay;
  final AnimationController controller;

  const FadeIn({
    key,
    required this.child,
    this.duration = 250,
    this.listener,
    this.autoPlay = true,
    required this.controller
  }) : super(key: key);

  @override
  FadeInState createState() => FadeInState();
}

class FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    createAnimate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void createAnimate() {
    if (widget.controller != null) {
      controller = widget.controller;
    } else {
      controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: widget.duration
        )
      );
    }

    animation = Tween(begin: 0.0, end: 1.0)
      .animate(controller)
      ..addListener(() {
        setState(() => null);
      });

    // 判断是添加监听
    if (widget.listener != null) {
      animation.addStatusListener(widget.listener);
    }

    // 判断是否自动播放
    if (widget.autoPlay) controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child
    );
  }
}
