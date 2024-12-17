/// 功能：load main
/// 描述：
/// By 向堂 2019/8/26

import 'package:flutter/material.dart';

import 'loadRing_widget.dart';
import 'threeBounce_widget.dart';
import 'location_widget.dart';
import 'point_widget.dart';

enum EluiLoadType {
  main,
  location,
  point,
  threeBounce,
  line
}

class ELuiLoadComponent extends StatelessWidget {
  final String type;
  final Color color;
  final controller;
  final double lineWidth;
  final double size;
  final duration;

  const ELuiLoadComponent({
    Key? key,
    required this.type,
    this.color = Colors.transparent,
    this.controller,
    this.lineWidth = 5,
    this.size = 30,
    this.duration
  }) : super(key: key);

  Widget _getLoadType () {
    switch (type) {
      case 'main':
        // todo 主线加载
        return Container();
      case 'location':
        return Location(
          size: size
        );
      case 'point':
        return point(
          size: size
        );
      case 'threeBounce':
        return ThreeBounce(
          color: color,
          controller: controller,
        );
      case 'line':
        return Ring(
            color: color,
            controller: controller,
            lineWidth: lineWidth,
            size: size
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getLoadType();
  }
}
