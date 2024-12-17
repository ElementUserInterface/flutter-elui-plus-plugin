import 'package:flutter/material.dart';

class ToastWidget extends StatelessWidget {
  final Widget? message;
  final bool? mask;
  final Widget? icon;
  final double width;
  final double _padding = 18.0;

  const ToastWidget({Key? key,
    this.message,
    this.icon,
    this.mask = false,
    this.width = 130.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    // icon判断
    if (icon != null) {
      children.add(icon!);
    }

    // 判断是否有文字
    if (message != null) {
      children.add(
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            right: 5.0,
            left: 5.0,
          ),
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.white
            ),
            child: message!
          )
        )
      );
    }

    // 弹窗内容
    final Widget child = DecoratedBox(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(17, 17, 17, 0.7),
        borderRadius: BorderRadius.all(Radius.circular(4.0))
      ),
      child: Padding(
        padding: EdgeInsets.only(top: _padding, bottom: _padding),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: width,
            minHeight: width - (_padding * 2.2)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children
          )
        ),
      )
    );

    // 判断是否显示遮罩
    if (mask!) {
      return Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: SizedBox(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.transparent
                ),
              )
            )
          ),
          // mask
          child
        ]
      );
    }

    return Align(
      alignment: Alignment.center,
      child: child
    );
  }
}
