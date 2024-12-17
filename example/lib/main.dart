import 'package:flutter/material.dart';
import 'router.dart';

void main(){
  runApp(MyApp());
}


void collectLog(String line){
  print('===================== 收集日志 S ========================');
  print(line.toString());
  print('===================== 收集日志 E ========================');
}

void reportErrorAndLog(FlutterErrorDetails details){
  print('===================== 上报错误和日志逻辑 S ========================');
  print(details.toString());
  print('===================== 上报错误和日志逻辑 E ========================');
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: indexPage(),
    );
  }
}
