import 'package:flutter/material.dart';

import 'package:flutter_elui_plugin/elui.dart';
import 'package:flutter_elui_plugin_example/pages/appbar.dart';
import 'package:flutter_elui_plugin_example/router.dart';

class indexPage extends StatefulWidget {
  const indexPage({Key? key}) : super(key: key);

  @override
  _indexpageState createState() => _indexpageState();
}

class _indexpageState extends State<indexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiAppBarComponent(context: context, title: '首页', isBack: false,),
        body: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text('Elui', style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue
                  )),
                  Text('Flutter UI库', style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue
                  ))
                ],
              ),
            ),
            EluiCellComponent(
              title: "head",
              label: "头",
              islink: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return appBarPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "cell",
              label: "单元格",
              islink: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return const cellPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "tag",
              label: "标签",
              islink: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return const tagPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "button",
              label: "按钮",
              islink: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return const buttonPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "message",
              label: "全局消息",
              islink: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return const messagePage();
                }));
              },
            ),
            EluiCellComponent(
              title: "input",
              label: "输入框",
              islink: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return inputPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "textarea",
              label: "多行输入框",
              islink: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return const textareaPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "img",
              label: "图片",
              islink: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return imgPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "numlndicator",
              label: "数字指示器",
              islink: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return const numlndicatorPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "tip",
              label: "提示",
              islink: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return const tipPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "popup",
              label: "弹窗",
              islink: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return const popupPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "radio",
              label: "单选",
              islink: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return const radioPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "checkbox",
              label: "复选",
              islink: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return checkboxPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "countdown",
              label: "倒计时",
              islink: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return countdownPage();
                }));
              },
            ),
          ],
        ));
  }
}
