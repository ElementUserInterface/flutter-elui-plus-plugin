import 'package:flutter/material.dart';

import 'package:flutter_elui_plugin/_theme/index.dart';
import 'package:flutter_elui_plugin/elui.dart';
import '../_animation/rotating.dart';

/// ENUM
/// 按钮颜色类型
enum ButtonType { none, succeed, warning, error, primary }

/// ENUM
/// 按钮大小
enum ButtonSize { mini, normal, large }

/// 按钮主题类型
class EluiButtonTypeItem {
  final String? name;
  final Color? backgroundColor;
  final Color? fontColor;
  final Color? disabledBackgroundColor;
  final Color? borderColor;
  final Color? hollowColor;

  EluiButtonTypeItem({
    this.name = "Button Type Name",
    this.backgroundColor,
    this.fontColor,
    this.disabledBackgroundColor,
    this.borderColor,
    this.hollowColor,
  });
}

/// 按钮单例属性样式
class EluiButtonClassItem {
  // 字体大小
  final double? fontSize;

  // 高度
  final double? height;

  // 图标大小
  final double? iconSize;

  // 边框大小
  final double? borderSize;

  EluiButtonClassItem({
    this.fontSize,
    this.height,
    this.iconSize,
    this.borderSize,
  });
}

/// 按钮属性样式
mixin EluiButtonClass {
   late EluiTheme eluitheme = EluiTheme();

  // 按钮大小类型
  late ButtonSize? sizeType;

  // 按钮大小
  late EluiButtonClassItem? size;

  // 大小配置列表
  late final List<EluiButtonClassItem>? sizeConfig = [
    EluiButtonClassItem(
      fontSize: 13.0,
      height: 40,
      iconSize: 14.0,
      borderSize: 0.4,
    ),
    EluiButtonClassItem(
      fontSize: 18.0,
      height: 50,
      iconSize: 16.0,
      borderSize: 0.5,
    ),
    EluiButtonClassItem(
      fontSize: 21.0,
      height: 60,
      iconSize: 18.0,
      borderSize: 0.6,
    ),
  ];

  // 颜色类型
  late EluiButtonTypeItem? type;

  // 颜色配置列表
  late final List<EluiButtonTypeItem>? typeConfig = [
    EluiButtonTypeItem(
      backgroundColor: Colors.transparent,
      fontColor: Colors.black,
      disabledBackgroundColor: Colors.transparent,
      borderColor: Colors.transparent,
      hollowColor: Colors.transparent,
    ),
    EluiButtonTypeItem(
      backgroundColor: eluitheme.succeedColor,
      fontColor: Colors.white,
      disabledBackgroundColor: eluitheme.succeedColorDisabled!,
      borderColor: eluitheme.succeedColorDisabled!,
      hollowColor: eluitheme.succeedColor!,
    ),
    EluiButtonTypeItem(
      backgroundColor: eluitheme.warnColor!,
      fontColor: Colors.white,
      disabledBackgroundColor: eluitheme.warnColorDisabled!,
      borderColor: eluitheme.primaryColor!,
      hollowColor: eluitheme.warnColor!,
    ),
    EluiButtonTypeItem(
      backgroundColor: eluitheme.errorColor!,
      fontColor: Colors.white,
      disabledBackgroundColor: eluitheme.errorColorDisabled!,
      borderColor: eluitheme.warnColor!,
      hollowColor: eluitheme.warnColor!,
    ),
    EluiButtonTypeItem(
      backgroundColor: eluitheme.primaryColor!,
      fontColor: Colors.white,
      disabledBackgroundColor: eluitheme.primaryColorDisabled!,
      borderColor: eluitheme.primaryColor!,
      hollowColor: eluitheme.primaryColor!,
    ),
  ];
}

class EluiButtonComponent extends StatefulWidget with EluiButtonClass {
  // 内容
  final dynamic child;

  // 禁用
  final bool disabled;

  // 点击回调
  final GestureTapCallback? onTap;

  // loading
  final bool loading;

  // 空心
  final bool hollow;

  // 主题
  final EluiButtonTheme? theme;

  // 圆角
  final bool radius;

  EluiButtonClass? eluibuttonClass;

  EluiButtonComponent({
    Key? key,
    this.child,
    ButtonSize size = ButtonSize.normal,
    ButtonType type = ButtonType.none,
    this.hollow = false,
    this.theme,
    this.radius = false,
    this.disabled = false,
    this.loading = false,
    this.onTap,
  }) : super(key: key) {
    this.size = sizeConfig![size.index];
    this.type = typeConfig![type.index];
  }

  @override
  _EluiButtonComponentState createState() => _EluiButtonComponentState();
}

class _EluiButtonComponentState extends State<EluiButtonComponent> with EluiButtonClass {
  // 主题
  late List<Map<String, Color>>? themeConfig;

  late EluiButtonTheme? _theme = EluiButtonTheme();

  // 按钮主题
  late EluiButtonTypeItem? type;

  @override
  void didChangeDependencies() {
    eluitheme = EluiUi.getTheme(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.zero;

    Widget _child;

    bool disabled = widget.loading || widget.disabled;

    if (widget.theme != null) {
      _theme = widget.theme;

      if (_theme!.borderRadius != null) {
        borderRadius = const BorderRadius.all(
          Radius.circular(4.0),
        );
      }
    }

    switch (widget.child.runtimeType) {
      case String:
        _child = Text(
          widget.child.toString(),
          style: _theme!.textStyle!,
        );
        break;
      default:
        _child = widget.child;
    }

    List<Widget> children = [
      DefaultTextStyle(
        style: TextStyle(
          fontSize: widget.size?.fontSize,
          color: widget.type?.fontColor!,
        ),
        child: _child,
      )
    ];

    if (widget.loading) {
      final Widget icon = Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Rotating(
          Icon(
            WeIcons.loading,
            color: type?.fontColor,
            size: widget.size?.iconSize,
          ),
        ),
      );
      children.insert(0, icon);
    }

    return Material(
      color: widget.type?.backgroundColor,
      child: InkWell(
        onTap: () => !disabled ? widget.onTap!() : null,
        borderRadius: borderRadius,
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: widget.size?.height,
          padding: _theme?.buttonPadding,
          decoration: BoxDecoration(
            color: disabled
                ? widget.type?.disabledBackgroundColor
                : widget.theme != null
                ? widget.theme?.backgroundColor
                : widget.type?.backgroundColor,
            border: widget.hollow || widget.theme == ButtonType.none
                ? Border.all(
              // width: widget.theme != null
              //     ? widget.theme?.borderWidth!
              //     : widget.size?.borderSize!,
              color: widget.theme!.borderColor ?? widget.theme!.borderColor!,
            )
                : null,
          ),
          child: Opacity(
            opacity: disabled ? 0.7 : 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: widget.size == ButtonSize.mini
                  ? MainAxisSize.min
                  : MainAxisSize.max,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}

/// 按钮主题
class EluiButtonTheme {
  final Color? backgroundColor;
  final double? borderWidth;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final EdgeInsets? buttonPadding;
  final TextStyle? textStyle;

  EluiButtonTheme({
    Key? key,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 2.0,
    this.borderRadius,
    this.textStyle,
    this.buttonPadding = const EdgeInsets.all(5),
  });
}
