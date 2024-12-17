/// 功能：input
/// 描述：
/// By 向堂 2019/8/27

import 'package:flutter/material.dart';

class EluiInputComponent extends StatefulWidget {
  final Map data;

  final String? title;

  final String? value;

  final String placeholder;

  final Widget? icon;

  final Widget? right;

  final TextInputAction? textInputAction;

  final List<String>? autofillHints;

  final TextInputType? type;

  final bool? internalstyle;

  final EluiInputTheme? theme;

  final int? maxLenght;

  final Function? onChange;

  EluiInputComponent({
    Key? key,
    this.data = const {},
    this.title,
    this.value = "",
    this.placeholder = "",
    this.icon,
    this.right,
    this.textInputAction,
    this.autofillHints = const <String>[],
    this.type,
    int? maxLenght,
    this.internalstyle = false,
    EluiInputTheme? theme,
    this.onChange,
  })
      : maxLenght = maxLenght,
        theme = theme ?? EluiInputTheme(),
        super(key: key);

  set setValue(String value) {
    // key.value.toString();
  }

  @override
  _EluiInputComponentState createState() => _EluiInputComponentState();
}

class _EluiInputComponentState extends State<EluiInputComponent> {
  /// 内部值长度
  int _text = 0;

  /// 输入器控制器
  TextEditingController controller = TextEditingController();

  @override
  initState() {
    _init();
  }

  // 初始化
  _init() {
    WidgetsBinding.instance?.addPostFrameCallback((Duration time) {
      _setValue(widget.value!);
    });
  }

  // 清除value

  // 输入框onChange
  void _onChange(String value) {
    if (widget.onChange is Function) {
      widget.onChange!({"data": widget.data, "value": value});
    }
    setState(() {});
  }

  void _setValue(String value) {
    if (value.isEmpty) return;
    setState(() {
      controller.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    EluiInputTheme? _theme = widget.theme;

    return Container(
      padding: widget.internalstyle != null
          ? const EdgeInsets.all(0)
          : const EdgeInsets.only(
        top: 15,
        bottom: 15,
        left: 20,
        right: 20,
      ),
      child: Row(
        children: <Widget>[
          if (widget.icon == null)
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: widget.icon,
            ),
          if (widget.title != null)
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Text(
                widget.title ?? '',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          Expanded(
            flex: 1,
            child: Input(
              placeholder: widget.placeholder,
              controller: controller,
              textInputAction: widget.textInputAction,
              autofillHints: widget.autofillHints,
              type: widget.type,
              maxLength: widget.maxLenght,
              maxLengthEnforced: true,
              contentPadding: widget.internalstyle == true ? const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 0,
              ) : null,
              textStyle: _theme?.textStyle ?? const TextStyle(
                color: Colors.white,
              ),
              onChange: (value_) {
                setState(() {
                  _text = value_["value"]
                      .toString()
                      .length;
                });
                _onChange(value_["value"]);
              },
            ),
          ),
          if (_text > 0)
            InkWell(
              child: Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.cancel, size: 20),
              ),
              onTap: () {
                controller.clear();
                setState(() {
                  _text = 0;
                });
              },
            ),
          if (widget.right != null) widget.right! else
            Container(),
        ],
      ),
    );
  }
}

class EluiInputTheme {
  final TextStyle? textStyle;

  EluiInputTheme({
    this.textStyle,
  });
}

class Input extends StatefulWidget {
  final focusNode;

  final placeholder;

  final maxLines;

  final maxLength;

  final contentPadding;

  final value;

  final textInputAction;

  final autofillHints;

  final type;

  final maxLengthEnforced;

  final Function onChange;

  final controller;

  final TextStyle? textStyle;

  const Input({Key? key,
    this.focusNode,
    this.placeholder,
    this.maxLines = 1,
    this.maxLength,
    this.contentPadding = const EdgeInsets.all(0),
    this.value,
    this.textInputAction,
    this.autofillHints = const <String>[],
    this.type = TextInputType.text,
    this.maxLengthEnforced = true,
    required this.onChange,
    this.textStyle,
    this.controller,
  }) : super(key: key);

  @override
  InputState createState() => InputState();
}

class InputState extends State<Input> {
  // 控制器
  final _name = TextEditingController();

  @override
  void initState() {
    super.initState();
    _name.text = widget.value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focusNode,
      style: widget.textStyle,
      textInputAction: widget.textInputAction,
      autofillHints: widget.autofillHints,
      obscureText: widget.type == TextInputType.visiblePassword ? true : false,
      keyboardType: widget.type,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      // maxLengthEnforced: widget.maxLengthEnforced,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        hintStyle: widget.textStyle?.copyWith(
          color: widget.textStyle?.color?.withOpacity(.6),
        ),
        border: InputBorder.none,
        fillColor: Colors.transparent,
        filled: false,
        isCollapsed: widget.contentPadding == null ? false : true,
        contentPadding: widget.contentPadding,
        counter: null,
        counterText: '',
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      controller: widget.controller ?? _name,
      onChanged: (value_) {
        widget.onChange({"value": value_});
      },
    );
  }
}
