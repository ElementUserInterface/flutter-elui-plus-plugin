import 'package:flutter/material.dart';

import 'package:flutter_elui_plugin/elui.dart';

class radioPage extends StatefulWidget {
  const radioPage({Key? key}) : super(key: key);

  @override
  _radioPageState createState() => _radioPageState();
}

class _radioPageState extends State<radioPage> {
  final key = GlobalKey<EluiRadioComponentState>();

  int radioGroupIndex = 0;

  List<Widget> radioGroup () {
    var data = [1,2,3,4];
    var color = [null, Colors.blue,Colors.amber,Colors.green];

    List<Widget> datalist = [];

    for(var i = 0 ; i < data.length; i++) {
      datalist.add(EluiRadioComponent(
        value: i.toString(),
        child: Text("内容"),
        checked: true,
        color: color[i],
        onChange: (index) {
          setState(() {
            radioGroupIndex = int.parse(index);
          });
        },
      ));
    }

    return datalist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: EluiAppBarComponent(context: context, title: '单选'),
      body: ListView(
        children: <Widget>[
          EluiCellComponent(
            title: "自定义",
            cont: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: radioGroup(),
            ),
          ),
          EluiRadioComponent(
            checked: true,
            child: const Text("测试。1"),
          )
        ],
      ),
    );
  }
}