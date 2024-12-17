import 'package:flutter/material.dart';

import 'package:flutter_elui_plugin/elui.dart';

class buttonPage extends StatefulWidget {
  const buttonPage({Key? key}) : super(key: key);

  @override
  _buttonPageState createState() => _buttonPageState();
}

class _buttonPageState extends State<buttonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EluiAppBarComponent(context: context, title: '按钮'),
      body: ListView(
        children: <Widget>[
          Card(
            child: EluiButtonComponent(
              radius: true,
              child: const Text("无"),
            ),
          ),
          EluiButtonComponent(
            disabled: true,
            type: ButtonType.primary,
            theme: EluiButtonTheme(backgroundColor: Colors.black),
            child: const Text("禁用"),
          ),
          EluiButtonComponent(
            type: ButtonType.succeed,
            child: const Text("成功"),
          ),
          EluiButtonComponent(
            type: ButtonType.warning,
            child: const Text("警告"),
          ),
          EluiButtonComponent(
            type: ButtonType.error,
            child: const Text("错误"),
          ),
          EluiButtonComponent(
            theme: EluiButtonTheme(backgroundColor: Colors.purpleAccent),
            child: const Text("自定义", style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(
            height: 20,
          ),
          EluiButtonComponent(
            radius: true,
            hollow: true,
            type: ButtonType.primary,
            theme: EluiButtonTheme(
              borderRadius: const BorderRadius.all(Radius.circular(2.0)),
              borderColor: Colors.black,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text("空心", style: TextStyle(fontSize: 14)),
                Text("空心状态下可以定义边框宽度", style: TextStyle(fontSize: 10))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          EluiButtonComponent(
            radius: true,
            type: ButtonType.primary,
            child: const Text("圆角"),
          ),
          EluiButtonComponent(
            size: ButtonSize.mini,
            type: ButtonType.primary,
            child: const Text("小"),
          ),
          EluiButtonComponent(
            size: ButtonSize.normal,
            type: ButtonType.primary,
            child: const Text("中"),
          ),
          EluiButtonComponent(
            size: ButtonSize.large,
            type: ButtonType.primary,
            child: const Text("大"),
          ),
          const SizedBox(
            height: 20,
          ),
          EluiButtonComponent(
            size: ButtonSize.normal,
            theme: EluiButtonTheme(
              buttonPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 100,
              ),
            ),
            type: ButtonType.primary,
            child: const Text("自定义 更大"),
          ),
        ],
      ),
    );
  }
}
