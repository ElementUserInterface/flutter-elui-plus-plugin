import 'package:flutter/material.dart';
import '../_toast/index.dart';

const Color _primaryColor = Color(0xff00b6c2);
const Color _primaryColorDisabled = Color(0xff09c6d2);

const Color _succeedColor = Color(0xff8bc34a);
const Color _succeedColorDisabled = Color.fromRGBO(96, 138, 48, 0.29);

const Color _errorColor = Color(0xffE64340);
const Color _errorColorDisabled = Color(0xffEC8B89);

const Color _warnColor = Color(0xffffc107);
const Color _warnColorBackground = Color.fromRGBO(255, 193, 7, 0.2);
const Color _warnColorDisabled = Color(0xfff5edd2);

const Color _defaultBackgroundColor = Color(0xfff8f8f8);
const Color _defaultBorderColor = Color(0xffd8d8d8);

const Color _maskColor = Color.fromRGBO(17, 17, 17, 0.6);

final _defaultTheme = EluiTheme();
final _defaultConfig = EluiConfig();

// 主题
class EluiTheme {
  // 主色
  final Color? primaryColor;

  // 主色禁用
  final Color? primaryColorDisabled;

  // 成功
  final Color? succeedColor;

  // 成功禁用
  final Color? succeedColorDisabled;

  // 警告色
  final Color? errorColor;

  // 警告色禁用
  final Color? errorColorDisabled;

  // 错误色
  final Color? warnColor;

  final Color? warnColorBackground;

  // 错误色禁用
  final Color? warnColorDisabled;

  // 默认背景色
  final Color? defaultBackgroundColor;

  // 默认边框色
  final Color? defaultBorderColor;

  // 遮罩层颜色
  final Color? maskColor;

  EluiTheme({
    this.primaryColor = _primaryColor,
    this.primaryColorDisabled = _primaryColorDisabled,
    this.succeedColor = _succeedColor,
    this.succeedColorDisabled = _succeedColorDisabled,
    this.errorColor = _errorColor,
    this.errorColorDisabled = _errorColorDisabled,
    this.warnColor = _warnColor,
    this.warnColorBackground = _warnColorBackground,
    this.warnColorDisabled = _warnColorDisabled,
    this.defaultBackgroundColor = _defaultBackgroundColor,
    this.defaultBorderColor = _defaultBorderColor,
    this.maskColor = _maskColor,
  });
}

// 配置
class EluiConfig {
  // toast 位置
  final WeToastInfoAlign toastInfoAlign;

  // toast info自动关闭时间
  final int toastInfoDuration;

  // toast loading关闭时间
  final int? toastLoadingDuration;

  // toast success关闭时间
  final int toastSuccessDuration;

  // toast fail关闭时间
  final int toastFailDuration;

  // notify自动关闭时间
  final int notifyDuration;

  // notify成功关闭时间
  final int notifySuccessDuration;

  // notify错误关闭时间
  final int notifyErrorDuration;

  EluiConfig({
    this.toastInfoAlign = WeToastInfoAlign.center,
    this.toastInfoDuration = 2500,
    this.toastLoadingDuration,
    this.toastSuccessDuration = 2500,
    this.toastFailDuration = 2500,
    this.notifyDuration = 3000,
    this.notifySuccessDuration = 3000,
    this.notifyErrorDuration = 3000,
  });
}

class EluiUi extends InheritedWidget {
  final EluiTheme theme;
  final EluiConfig config;

  const EluiUi({
    Key? key,
    required this.theme,
    required this.config,
    required Widget child,
  }) : super(key: key, child: child);

  static EluiUi? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EluiUi>();
  }

  // 获取主题配置
  static EluiTheme getTheme(BuildContext context) {
    final EluiUi? weui = EluiUi.of(context);
    return weui == null ? _defaultTheme : weui.theme;
  }

  // 获取全局配置
  static EluiConfig getConfig(BuildContext context) {
    final EluiUi? weui = EluiUi.of(context);
    return weui == null ? _defaultConfig : weui.config;
  }

  @override
  bool updateShouldNotify(EluiUi oldWidget) {
    return true;
  }
}
