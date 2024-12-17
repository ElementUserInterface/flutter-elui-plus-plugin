/// 单元格

import 'package:flutter/material.dart';

/// 单元格方向
class EluiCellTextAlign {
  static const CrossAxisAlignment left = CrossAxisAlignment.start;
  static const CrossAxisAlignment center = CrossAxisAlignment.center;
  static const CrossAxisAlignment right = CrossAxisAlignment.end;
}

/// 单元格主题
class EluiCellTheme {
  final Color? titleColor;
  final Color? labelColor;
  final Color? linkColor;
  final Color? backgroundColor;
  final EdgeInsets? cellPadding;

  static ThemeData? theme;

  EluiCellTheme({
    this.titleColor,
    this.labelColor,
    this.linkColor = Colors.black,
    this.backgroundColor = Colors.transparent,
    this.cellPadding,
  });
}

class EluiCellComponent extends StatefulWidget {
  // 图标
  final Widget? icons;

  // 题目
  final String? title;

  // 副题目
  final String? label;

  // 主题
  final EluiCellTheme? theme;

  // 是否显示箭头
  final bool islink;

  // 是否显示下方的边框
  final bool isBotton;

  // 单元格后方填充内容
  final Widget? cont;

  // 文本方向
  final CrossAxisAlignment textAlign;

  // 回调事件
  final GestureTapCallback? onTap;

  const EluiCellComponent({
    this.icons,
    this.title,
    this.islink = false,
    this.isBotton = false,
    this.label,
    this.theme,
    this.cont,
    this.textAlign = EluiCellTextAlign.center,
    this.onTap,
  });

  @override
  State<EluiCellComponent> createState() {
    return EluiCellComponentState();
  }
}

class EluiCellComponentState extends State<EluiCellComponent> {
  late EluiCellTheme _theme = EluiCellTheme();

  @override
  Widget build(BuildContext context) {
    if (widget.theme != null) {
      _theme = widget.theme!;
    }

    return GestureDetector(
      child: Container(
        color: _theme.backgroundColor ?? Theme.of(context).cardColor,
        padding: _theme.cellPadding ?? const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: widget.textAlign,
          children: <Widget>[
            if (widget.icons != null)
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: widget.icons,
              ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: widget.label != null ? 5 : 0),
                      child: Text(
                        widget.title!,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: _theme.titleColor),
                      ),
                    ),
                    if (widget.label != null)
                      Text(
                        widget.label!,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 11, color: _theme.labelColor),
                        overflow: TextOverflow.ellipsis,
                        maxLines: widget.label?.length,
                      ),
                  ],
                ),
              ),
            ),
            if (widget.cont != null)
              Row(
                children: <Widget>[
                  widget.cont!,
                  if (widget.islink)
                    const SizedBox(
                      width: 10,
                    ),
                ],
              ),
            EluiCellLink(
              islink: widget.islink,
            )..linkColor = Theme.of(context).iconTheme.color ?? _theme.linkColor!,
          ],
        ),
      ),
      onTap: widget.onTap,
    );
  }
}

class EluiCellIcon extends StatelessWidget {
  final Widget child;
  final bool show;

  const EluiCellIcon({
    required this.child,
    this.show = false,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: show,
      child: child,
    );
  }
}

class EluiCellLink extends StatelessWidget {
  final bool islink;
  late Color? linkColor;

  EluiCellLink({Key? key,
    required this.islink,
    this.linkColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: islink,
      child: Icon(
        Icons.keyboard_arrow_right,
        color: linkColor,
      ),
    );
  }
}
