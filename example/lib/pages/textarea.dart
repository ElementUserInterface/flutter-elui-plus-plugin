import 'package:flutter/material.dart';

import 'package:flutter_elui_plugin/elui.dart';

class textareaPage extends StatefulWidget {
  const textareaPage({Key? key}) : super(key: key);

  @override
  _textareaPageState createState() => _textareaPageState();
}

class _textareaPageState extends State<textareaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiAppBarComponent(context: context, title: '多行输入框'),
        body: ListView(
          children: <Widget>[
            EluiTextareaComponent(
              maxLength: 100,
            )
          ],
        ));
  }
}
