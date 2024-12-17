import 'package:flutter/material.dart';
import '../utils.dart';
import './info.dart';
import './toast.dart';
import '../_animation/rotating.dart';
import '../_icon/index.dart';
import 'package:flutter_elui_plugin/_theme/index.dart';

/// 对齐方式
enum WeToastInfoAlign {
  // 上对齐
  top,
  // 居中
  center,
  // 下对齐
  bottom,
}

// loading icon
final Widget _loadingIcon =
    Image.asset('assets/images/loading.png', height: 42.0, package: 'weui');
// success icon
const Widget _successIcon = Icon(WeIcons.hook, color: Colors.white, size: 49.0);
// fail icon
const Widget _failIcon = Icon(WeIcons.info, color: Colors.white, size: 49.0);
// 对齐方式
final List<String> _weToastAlign = ['top', 'center', 'bottom'];

// info
typedef _info = Function(dynamic message,
    {int duration, WeToastInfoAlign align, double distance});
// loading
typedef _loading = Function(
    {dynamic message, int duration, bool mask, Widget icon});
// success
typedef _success = Function(
    {dynamic message, int duration, bool mask, Widget icon, Function onClose});
// fail
typedef _fail = Function(
    {dynamic message, int duration, bool mask, Widget icon, Function onClose});
// toast
typedef _toast = Function(
    {dynamic message, int duration, bool mask, Widget icon, Function onClose});
// loading close
typedef _close = Function();

class WeToast {
  // 信息提示
  static _info info(BuildContext context) {
    return (message,
        {int? duration, WeToastInfoAlign? align, distance = 100.0}) async {
      final EluiConfig config = EluiUi.getConfig(context);
      // 转换
      final Widget? messageWidget = toTextWidget(message, 'message');
      final remove = createOverlayEntry(
          context: context,
          child: InfoWidget(messageWidget!,
              align: _weToastAlign[
                  align == null ? config.toastInfoAlign.index : align.index],
              distance: distance));

      // 自动关闭
      await Future.delayed(
          Duration(milliseconds: duration ?? config.toastInfoDuration));
      remove();
    };
  }

  // 加载中
  static _loading loading(BuildContext context) {
    _close show({message, duration, mask = true, icon}) {
      final int? toastLoadingDuration =
          EluiUi.getConfig(context).toastLoadingDuration;

      return WeToast.toast(context)(
          icon: Rotating(icon ?? _loadingIcon, duration: 800),
          mask: mask,
          message: message,
          duration: duration ?? toastLoadingDuration);
    }

    return show;
  }

  // 成功
  static _success success(BuildContext context) {
    return (
        {dynamic message,
        int? duration,
        mask = true,
        icon = _successIcon,
        Function? onClose,}) {
      final int toastSuccessDuration =
          EluiUi.getConfig(context).toastSuccessDuration;
      WeToast.toast(context)(
        icon: icon,
        mask: mask,
        message: message,
        duration: duration ?? toastSuccessDuration,
        onClose: onClose!,
      );
    };
  }

  // 失败
  static _fail fail(BuildContext context) {
    return ({
      message,
      int? duration,
      mask = true,
      icon = _failIcon,
      Function? onClose,
    }) {
      final int toastFailDuration = EluiUi.getConfig(context).toastFailDuration;
      WeToast.toast(context)(
        icon: icon,
        mask: mask,
        message: message,
        duration: duration ?? toastFailDuration,
        onClose: onClose!,
      );
    };
  }

  // 提示
  static _toast toast(BuildContext context) {
    return ({
      message,
      int? duration,
      mask = true,
      Widget? icon,
      Function? onClose,
    }) {
      // 转换
      final Widget? messageWidget = toTextWidget(message, 'message');
      Function remove = createOverlayEntry(
        context: context,
        child: ToastWidget(
          message: messageWidget,
          mask: mask,
          icon: icon,
        ),
      );

      void close() {
        remove();
      }

      // 自动关闭
      if (duration != null) {
        Future.delayed(Duration(milliseconds: duration), () {
          close();
          // 关闭回调
          if (onClose is Function) onClose();
        });
      }

      return close;
    };
  }
}
