import 'package:flutter/material.dart';
import 'dart:io';
import './android_widget.dart';
import './ios_widget.dart';
import '../utils.dart';

// 关闭函数
typedef _Close = Function();
// change
typedef _onChange = Function(String index);
// 安卓
typedef WeActionsheetAndroid = Function(
    {@required List<EluiActionsheetItem> options,
    bool maskClosable,
    _Close onClose,
    _onChange onChange});
// ios
typedef WeActionsheetIos = Function(
    {dynamic title,
    @required List<EluiActionsheetItem> options,
    bool maskClosable,
    dynamic cancelButton,
    _Close onClose,
    _onChange onChange});

// WeActionsheet
class EluiActionsheetComponent {
  // show
  static WeActionsheetAndroid? show(BuildContext context) {
    if (Platform.isIOS) {
      return ios(context);
    } else if (Platform.isAndroid) {
      return android(context);
    }
    return null;
  }

  // 安卓样式
  static WeActionsheetAndroid android(BuildContext context) {
    return ({
      maskClosable = true,
      Function? onClose,
      Function? onChange,
      List<EluiActionsheetItem>? options,
    }) {
      final GlobalKey widgetKey = GlobalKey();
      Function? remove;

      // 关闭
      void hide() {
        remove!();
        if (onClose is Function) {
          onClose();
        }
      }

      // 点击
      void itemClick(int index) {
        remove!();
        if (onChange is Function) {
          final String? value = options![index].value;
          onChange(value ?? index.toString());
        }
      }

      remove = createOverlayEntry(
          context: context,
          backIntercept: true,
          child: AndroidWidget(
              key: widgetKey,
              maskClosable: maskClosable,
              close: hide,
              onChange: itemClick,
              childer: options),
          willPopCallback: () {
            (widgetKey.currentState as AndroidWidgetState).close();
          });
    };
  }

  // ios 样式
  static WeActionsheetIos ios(BuildContext context) {
    return ({
      title,
      List<EluiActionsheetItem>? options,
      maskClosable = true,
      cancelButton,
      Function? onClose,
      Function? onChange,
    }) {
      final GlobalKey widgetKey = GlobalKey();
      Function? remove;

      // 关闭
      void hide() {
        remove!();
        if (onClose is Function) {
          onClose();
        }
      }

      // 点击
      void itemClick(int index) {
        remove!();
        if (onChange is Function) {
          final String? value = options![index].value;
          onChange(value ?? index.toString());
        }
      }

      remove = createOverlayEntry(
          context: context,
          backIntercept: true,
          child: IosWidget(
              key: widgetKey,
              title: title,
              cancelButton: cancelButton,
              maskClosable: maskClosable,
              close: hide,
              onChange: itemClick,
              childer: options),
          willPopCallback: () {
            (widgetKey.currentState as IosWidgetState).close();
          });
    };
  }
}

class EluiActionsheetItem {
  final dynamic label;
  final String value;

  EluiActionsheetItem({
    required this.label,
    required this.value,
  });
}
