import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_elui_plugin/_message/message.dart';
import 'package:flutter_elui_plugin/_theme/index.dart';
import '../utils.dart';

/// typedef
/// 基本模式
typedef _Notify = Function({
  int duration,
  Alignment align,
  int time,
  required Widget child,
});

/// typedef
/// SHOW模式
typedef _Show = Function({
  EluiMessageTheme? theme,
  Alignment? align,
  int? duration,
  int? time,
  required Widget child,
});

/// 通知主题
class EluiMessageTheme {
  final Alignment? messageAlign;
  final Color? messageColor;

  EluiMessageTheme({
    this.messageAlign,
    this.messageColor,
  });
}

class EluiMessageComponent extends ScaffoldState {
  // 成功
  static _Notify success(BuildContext context) {
    final int notifySuccessDuration =
        EluiUi.getConfig(context).notifySuccessDuration;

    return ({int? duration, Alignment? align, Widget? child, time = 3000}) {
      EluiMessageComponent.show(context)(
        theme: EluiMessageTheme(
          messageColor: EluiUi.getTheme(context).succeedColor!,
        ),
        align: align,
        time: time,
        duration: duration == null ? notifySuccessDuration : duration,
        child: child!,
      );
    };
  }

  // 失败
  static _Notify error(BuildContext context) {
    final int notifyErrorDuration =
        EluiUi.getConfig(context).notifyErrorDuration;
    return ({int? duration, Alignment? align, Widget? child, time = 3000}) {
      EluiMessageComponent.show(context)(
        theme: EluiMessageTheme(
          messageColor: EluiUi.getTheme(context).errorColor!,
        ),
        align: align,
        time: time,
        duration: duration ?? notifyErrorDuration,
        child: child!,
      );
    };
  }

  // 警告2
  static _Notify warning2 (context) {
    final int notifyErrorDuration = EluiUi.getConfig(context).notifyErrorDuration;
    return ({int? duration, Alignment? align, Widget? child, time = 3000}) {
      EluiMessageComponent.show(context)(
        theme: EluiMessageTheme(
          messageColor: EluiUi.getTheme(context).warnColor!,
        ),
        align: align,
        time: time,
        duration: duration ?? notifyErrorDuration,
        child: child!,
      );
    };
  }

  // 警告
  static _Notify warning(BuildContext context) {
    final int notifyErrorDuration = EluiUi.getConfig(context).notifyErrorDuration;
    return ({int? duration, Alignment? align, Widget? child, time = 3000}) {
      EluiMessageComponent.show(context)(
        theme: EluiMessageTheme(
          messageColor: EluiUi.getTheme(context).warnColor!,
        ),
        align: align,
        time: time,
        duration: duration ?? notifyErrorDuration,
        child: child!,
      );
    };
  }

  static _Show show(BuildContext context) {
    final int notifyDuration = EluiUi.getConfig(context).notifyDuration;
    return ({
      EluiMessageTheme? theme,
      Alignment? align,
      int? duration,
      Widget? child,
      time = 3000,
    }) {
      final GlobalKey widgetKey = GlobalKey();
      final Function remove = createOverlayEntry(
        context: context,
        child: EluiMessageComponentWidget(
          key: widgetKey,
          align: align,
          color: theme?.messageColor ?? EluiUi.getTheme(context).defaultBackgroundColor,
          child: child!,
        ),
      );

      void close() async {
        await (widgetKey.currentState as EluiMessageComponentWidgetState)
            .reverseAnimation();
        remove();
      }

      Timer(Duration(milliseconds: time!), () {
        Duration(milliseconds: duration ?? notifyDuration);
        close();
      });
    };
  }
}
