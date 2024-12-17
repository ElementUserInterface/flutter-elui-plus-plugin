/// 数字指示器

import 'package:flutter/material.dart';

import 'package:flutter_elui_plugin/elui.dart';

class numlndicatorPage extends StatefulWidget {
  const numlndicatorPage({Key? key}) : super(key: key);

  @override
  _numlndicatorPageState createState() => _numlndicatorPageState();
}

class _numlndicatorPageState extends State<numlndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiAppBarComponent(context: context, title: '数字指示器'),
        body: ListView(
          children: <Widget>[
            EluiCellComponent(
                title: "标准",
                cont: SizedBox(
                  width: 200,
                  child: EluiNumlndicatorComponent(
                    value: 5.0,
                  ),
                )),
            EluiCellComponent(
                title: "最小值",
                label: "设置最小值0",
                cont: SizedBox(
                  width: 200,
                  child: EluiNumlndicatorComponent(
                    min: 0,
                  ),
                )),
            EluiCellComponent(
                title: "最大值",
                label: "设置最大值10",
                cont: SizedBox(
                  width: 200,
                  child: EluiNumlndicatorComponent(max: 10),
                )),
            EluiCellComponent(
                title: "最大值与最小值",
                label: "0 - 10",
                cont: SizedBox(
                  width: 200,
                  child: EluiNumlndicatorComponent(min: 0, max: 10),
                ))
          ],
        ));
  }
}
