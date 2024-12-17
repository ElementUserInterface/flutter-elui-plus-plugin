import 'package:flutter/material.dart';

import 'package:flutter_elui_plugin/elui.dart';

class messagePage extends StatefulWidget {
  const messagePage({Key? key}) : super(key: key);

  @override
  _messagePageState createState() => _messagePageState();
}

class _messagePageState extends State<messagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiAppBarComponent(context: context, title: '全局消息'),
        body: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
              child: EluiButtonComponent(
                radius: true,
                type: ButtonType.none,
                child: const Text("标准消息提示"),
                onTap: () {
                  EluiMessageComponent.show(context)(child: const Text('内容', style: TextStyle(color: Colors.black)));
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
              child: EluiButtonComponent(
                radius: true,
                type: ButtonType.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[Text("自定义消息提示"), Text("设置黑色背影颜色,居左中", style: TextStyle(fontSize: 10))],
                ),
                onTap: () {
                  EluiMessageComponent.show(context)(
                    theme: EluiMessageTheme(
                      messageColor: Colors.black,
                    ),
                    align: Alignment.centerLeft,
                    child: const Text('内容'),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
              child: EluiButtonComponent(
                radius: true,
                type: ButtonType.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[Text("持续更久"), Text("设置显示时间", style: TextStyle(fontSize: 10))],
                ),
                onTap: () {
                  EluiMessageComponent.success(context)(
                    child: const Text('10秒'),
                    time: 1000 * 10,
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
              child: EluiButtonComponent(
                radius: true,
                type: ButtonType.succeed,
                child: const Text("成功"),
                onTap: () {
                  EluiMessageComponent.success(context)(child: const Text('成功'));
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
              child: EluiButtonComponent(
                radius: true,
                type: ButtonType.warning,
                child: const Text("警告"),
                onTap: () {
                  EluiMessageComponent.warning(context)(child: const Text('警告'));
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
              child: EluiButtonComponent(
                radius: true,
                type: ButtonType.error,
                child: const Text("错误"),
                onTap: () {
                  EluiMessageComponent.error(context)(child: const Text('错误'));
                },
              ),
            ),
          ],
        ));
  }
}
