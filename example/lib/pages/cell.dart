import 'package:flutter/material.dart';

import 'package:flutter_elui_plugin/elui.dart';

class cellPage extends StatefulWidget {
  const cellPage({Key? key}) : super(key: key);

  @override
  _cellPageState createState() => _cellPageState();
}

class _cellPageState extends State<cellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EluiAppBarComponent(context: context, title: '单元格'),
      body: ListView(
        children: <Widget>[
          const EluiCellComponent(
            title: '普通',
          ),
          const EluiCellComponent(
            title: '普通',
            label: '带label属性',
          ),
          const EluiCellComponent(
            icons: Icon(Icons.warning, size: 30, color: Color(0xffe343e3)),
            title: '普通',
            label: '设Icon插槽',
          ),
          const EluiCellComponent(
            icons: Icon(Icons.library_music),
            title: '普通',
            label: '设置箭头',
            islink: true,
          ),
          const EluiCellComponent(
            icons: Icon(Icons.supervised_user_circle),
            title: '普通',
            label: '设置cont插槽内容',
            cont: Text('自定义内容'),
          ),
          EluiCellComponent(
            icons: const Icon(
              Icons.library_music,
              color: Colors.white,
            ),
            theme: EluiCellTheme(
              labelColor: Colors.white54,
              titleColor: Colors.white,
              linkColor: Colors.white,
              backgroundColor: Colors.blueAccent,
            ),
            title: '主题',
            label: '设置箭头',
            islink: true,
          ),
        ],
      ),
    );
  }
}
