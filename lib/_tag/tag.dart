/// 功能：单选
/// 描述：
/// By 向堂 2019/9/5

import 'package:flutter/material.dart';
//import 'package:flutter_elui_plugin/_theme/signin.dart';

/// ENUM
/// 标签大小
enum EluiTagSize { no2, no3, no4, no5, no7 }

/// ENUM
/// 标签类型
enum EluiTagType { none, succeed, warning, error, primary }

/// 单例标签样式
class EluiTagSizeItem {
  final String? name;
  final double paddingTop;
  final double paddingRight;
  final double paddingLeft;
  final double paddingBottom;
  final double? fontSize;

  EluiTagSizeItem({
    this.name = "Item Name",
    this.paddingTop = 0.0,
    this.paddingRight = 0.0,
    this.paddingLeft = 0.0,
    this.paddingBottom = 0.0,
    this.fontSize = 0.0,
  });
}

/// 单例标签样式
class EluiTagColorItem {
  // 名字
  final String? name;

  // 颜色
  final Color? color;

  // 字体颜色
  final Color? textColor;

  // 边框颜色
  final Color? borderColor;

  EluiTagColorItem({
    this.name,
    this.color,
    this.textColor,
    this.borderColor,
  });
}

mixin _EluiTagSizeClass {
  // tag大小类型
  late EluiTagSize? tagType;

  // tag大小
  late EluiTagSizeItem? size;

  // 大小配置
  final List<EluiTagSizeItem> tagSizeList = [
    EluiTagSizeItem(
      name: '3 Size',
      paddingTop: 2,
      paddingRight: 5,
      paddingLeft: 5,
      paddingBottom: 2,
      fontSize: 12,
    ),
    EluiTagSizeItem(
      name: '3 Size',
      paddingTop: 2,
      paddingRight: 5,
      paddingLeft: 5,
      paddingBottom: 2,
      fontSize: 12,
    ),
    EluiTagSizeItem(
      name: '4 Size',
      paddingTop: 8,
      paddingRight: 10,
      paddingLeft: 10,
      paddingBottom: 8,
      fontSize: 12,
    ),
    EluiTagSizeItem(
      name: '5 Size',
      paddingTop: 10,
      paddingRight: 14,
      paddingLeft: 14,
      paddingBottom: 10,
      fontSize: 12,
    ),
    EluiTagSizeItem(
      name: '7 Size',
      paddingTop: 15,
      paddingRight: 20,
      paddingLeft: 20,
      paddingBottom: 15,
      fontSize: 12,
    ),
  ];
}

mixin _EluiTagColorClass {
  // tag 颜色类型
  late EluiTagType tagColor;

  // tag 颜色列表
  late EluiTagColorItem color;

  // 颜色配置
  List<EluiTagColorItem> tagColorList = [
    EluiTagColorItem(
      name: "none",
      color: Colors.transparent,
    ),
    EluiTagColorItem(
      name: "suceed",
      color: const Color.fromRGBO(96, 138, 48, 0.2),
      textColor: const Color(0xff8bc34a),
      borderColor: const Color.fromRGBO(96, 138, 48, 0.2),
    ),
    EluiTagColorItem(
      name: "warning",
      color: const Color(0xffffc107),
      textColor: const Color(0xffffffff),
      borderColor: const Color(0xffffc107),
    ),
    EluiTagColorItem(
      name: "error",
      color: const Color.fromRGBO(226, 48, 35, 0.2),
      textColor: const Color(0xffffffff),
      borderColor: const Color(0xfff44336),
    ),
    EluiTagColorItem(
      name: "primary",
      color: const Color.fromRGBO(24, 182, 193, 0.2),
      textColor: const Color(0xff18b6c1),
      borderColor: const Color.fromRGBO(24, 182, 193, 0.2),
    ),
  ];
}

/// 标签主题
class EluiTagTheme<EluiTagType> with _EluiTagColorClass {
  final Color borderColor; // 边框颜色
  final Color textColor; // 字体颜色
  final Color backgroundColor; // 背景颜色

  EluiTagTheme({
    Key? key,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.transparent,
    this.backgroundColor = Colors.transparent,
  });
}

class EluiTagComponent extends StatefulWidget
    with _EluiTagSizeClass, _EluiTagColorClass {
  // theme
  final EluiTagTheme? theme;

  // 圆角
  final bool round;

  // 值
  final String? value;

  // 幽灵
  final bool plain;

  // 自定义字体颜色
  final TextStyle? textStyle;

  // 是否关闭
  final bool isClose;

  // 取消
  final Function? onClose;

  // 单击
  final Function? onTap;

  // 长单击
  final Function? onLongPress;

  EluiTagComponent({
    Key? key,
    this.theme,
    this.round = false,
    this.value,
    this.plain = false,
    this.textStyle,
    EluiTagType color = EluiTagType.none,
    this.isClose = false,
    this.onClose,
    this.onTap,
    this.onLongPress,
    EluiTagSize size = EluiTagSize.no4,
  }) : super(key: key) {
    this.size = tagSizeList[size.index];
    this.color = tagColorList[color.index];
    tagType = size;
    tagColor = color;
  }

  @override
  EluiTagComponentState createState() => EluiTagComponentState();
}

class EluiTagComponentState extends State<EluiTagComponent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        GestureDetector(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: widget.plain
                      ? Colors.transparent
                      : (widget.theme != null
                      ? widget.theme?.backgroundColor
                      : widget.color.color),
                  borderRadius: BorderRadius.all(
                      Radius.circular(widget.round ? 100 : 2.0)),
                  border: widget.plain
                      ? Border.all(
                    style: BorderStyle.solid,
                    color: widget.theme != null
                        ? widget.theme!.borderColor
                        : widget.color.textColor!,
                  )
                      : null,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: widget.size!.paddingTop,
                    right: widget.size!.paddingRight,
                    bottom: widget.size!.paddingBottom,
                    left: widget.size!.paddingLeft,
                  ),
                  child: DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 13.0, color: widget.color.textColor),
                    child: Text(
                      widget.value!,
                      style: widget.textStyle,
                    ),
                  ),
                ),
              )
            ],
          ),
          onTap: () => widget.onTap!(),
          onLongPress: () => widget.onLongPress!(),
        ),
        Positioned(
          right: -5,
          top: -5,
          child: Offstage(
            offstage: !widget.isClose,
            child: GestureDetector(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 10,
                  height: 10,
                  color: widget.color.color ?? const Color(0xfff2f2f2),
                  child: Icon(
                    Icons.close,
                    size: 8,
                    color: widget.color.textColor ?? const Color(0xff000000),
                  ),
                ),
              ),
              onTap: () => widget.onClose!(),
            ),
          ),
        )
      ],
    );
  }
}
