/// 全局消息

import 'package:flutter/material.dart';
import 'dart:ui';

class EluiMessageComponentWidget extends StatefulWidget {
  final Color? color;
  final Widget child;
  final Alignment? align;

  const EluiMessageComponentWidget({
    key,
    this.color,
    this.align = Alignment.center,
    required this.child,
  }) : super(key: key);

  @override
  EluiMessageComponentWidgetState createState() =>
      EluiMessageComponentWidgetState();
}

class EluiMessageComponentWidgetState extends State<EluiMessageComponentWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  //高度动画
  late Animation<double> offsetAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  // 初始化动画
  void initAnimation() {
    controller = AnimationController(
        duration: const Duration(
          milliseconds: 150,
        ),
        vsync: this);

    offsetAnimation = Tween<double>(begin: -1, end: 0).animate(
      CurvedAnimation(parent: controller, curve: Curves.ease),
    )..addListener(() {
        setState(() {});
      });

    // 播放
    controller.forward();
  }

  // 反向执行动画
  reverseAnimation() async {
    await controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        left: 0,
        top: 0,
        right: 0,
        child: FractionalTranslation(
          translation: Offset(0, offsetAnimation.value),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: widget.color,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .08),
                  offset: Offset(5.0, 5.0),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQueryData.fromWindow(window).padding.top + 15,
                bottom: 15,
                left: 15,
                right: 15,
              ),
              child: Align(
                alignment: widget.align ?? Alignment.center,
                child: DefaultTextStyle(
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
