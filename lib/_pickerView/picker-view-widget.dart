import 'package:flutter/material.dart';
import 'package:flutter_elui_plugin/_theme/index.dart';

typedef OnChange = void Function(List<String> value);

class EluiPickerViewComponent extends StatefulWidget {
  final int itemCount;
  final double itemHeight;
  final OnChange? onChange;
  final Function? onSucceed;
  final List<List<EluiPickerItem>> options;

  const EluiPickerViewComponent({
    Key? key,
    itemCount = 5,
    this.itemHeight = 42,
    this.onChange,
    this.onSucceed,
    required this.options,
  })  : assert(itemCount % 2 == 1),
        itemCount = itemCount,
        super(key: key);

  @override
  EluiPickerViewComponentState createState() => EluiPickerViewComponentState();
}

class EluiPickerViewComponentState extends State<EluiPickerViewComponent> {
  final Map<int, double> tops = {};
  late double boxHeight;
  late double borderTop;
  late double _startY;
  double _endY = 0;
  late List itemValue;
  late EluiTheme theme;

  @override
  initState() {
    super.initState();
    final double placeholderNumber = (widget.itemCount - 1) / 2;
    // 计算线框top值
    borderTop = placeholderNumber * widget.itemHeight;
    boxHeight = widget.itemHeight * widget.itemCount;
    itemValue = List.filled(widget.options.length, null, growable: false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = EluiUi.getTheme(context);
  }

  getValue(top, index) {
    var itemValueMap = [-widget.itemHeight];
    var indexs = 0;
    for (var i = 0; i < widget.options[index].length + 1; i++) {
      if (i > 1) {
        itemValueMap.add(-(widget.itemHeight * i));
      }
    }
    for (var i in itemValueMap) {
      indexs = indexs + 1;
      if (top <= i) {
        itemValue[index] = indexs;
      }
      if (top == 0.0) {
        itemValue[index] = 0;
      }
    }
    widget.onSucceed!(itemValue);
  }

  onVerticalDragDown(DragDownDetails _, int index) {
    _startY = _.globalPosition.dy;
    _endY = (tops[index] ?? 0);
  }

  onVerticalDragUpdate(DragUpdateDetails _, int index) {
    setState(() {
      tops[index] = _endY + (_.globalPosition.dy - _startY);
    });
  }

  onVerticalDragEnd(int index) {
    final double itemHalfHiehgt = widget.itemHeight / 2;
    final double colHeight = widget.options[index].length * widget.itemHeight;
    final double currentTop = -tops[index]!;
    double top;

    // 判断边界值
    if (currentTop <= itemHalfHiehgt) {
      top = 0;
    } else if (currentTop >= colHeight - itemHalfHiehgt) {
      top = -(colHeight - widget.itemHeight);
    } else {
      int number = (tops[index]! ~/ widget.itemHeight);
      number = number +
          (-tops[index]! % widget.itemHeight >= itemHalfHiehgt ? -1 : 0);
      top = number * widget.itemHeight;
    }

    setState(() {
      tops[index] = top;
      getValue(top, index);
    });
  }

  DecoratedBox _renderMaskDecoratedBox(Alignment begin, Alignment end) {
    return DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: begin, end: end, colors: [
      const Color.fromRGBO(255, 255, 255, 0.2),
      const Color.fromRGBO(255, 255, 255, 1)
    ])));
  }

  List<Widget> renderItem() {
    final List<Widget> columns = [];

    for (int i = 0; i < widget.options.length; i++) {
      final column = widget.options[i];
      columns.add(
        Expanded(
          flex: 1,
          child: GestureDetector(
            onVerticalDragDown: (_) {
              onVerticalDragDown(_, i);
            },
            onVerticalDragUpdate: (_) {
              onVerticalDragUpdate(_, i);
            },
            onVerticalDragEnd: (_) {
              onVerticalDragEnd(i);
            },
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Stack(children: [
                Positioned(
                    top: tops[i] ?? 0,
                    right: 0,
                    left: 0,
                    child: Padding(
                        padding: EdgeInsets.only(top: borderTop),
                        child: Column(
                            children: column.map((item) {
                          return SizedBox(
                              height: widget.itemHeight,
                              child: DefaultTextStyle(
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(item.label))));
                        }).toList()))),
                Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: borderTop + widget.itemHeight,
                    child: _renderMaskDecoratedBox(
                        Alignment.bottomCenter, Alignment.topCenter)),
                Positioned(
                    top: borderTop + widget.itemHeight,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    child: _renderMaskDecoratedBox(
                        Alignment.topCenter, Alignment.bottomCenter))
              ]),
            ),
          ),
        ),
      );
    }

    return columns;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: boxHeight,
      child: Stack(
        children: [
          Row(children: renderItem()),
          Positioned(
              top: borderTop,
              left: 0,
              right: 0,
              child: Divider(height: 1, color: theme.defaultBorderColor)),
          Positioned(
              top: borderTop + widget.itemHeight,
              left: 0,
              right: 0,
              child: Divider(height: 1, color: theme.defaultBorderColor))
        ],
      ),
    );
  }
}

class EluiPickerItem {
  final String label;
  final String value;

  EluiPickerItem({required this.label, required this.value});
}
