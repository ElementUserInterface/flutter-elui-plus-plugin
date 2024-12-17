/// vacancy

import 'package:flutter/material.dart';

class EluiVacancyComponent extends StatefulWidget {
  final String? title;

  final Widget? cont;

  final double? height;

  EluiVacancyComponent({
    Key? key,
    this.title,
    this.cont,
    this.height,
  }) : super(key: key);

  @override
  _EluiVacancyComponentState createState() => _EluiVacancyComponentState();
}

class _EluiVacancyComponentState extends State<EluiVacancyComponent> {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        height: widget.height,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget.cont ?? Container(),
            Padding(
              child: Text(widget.title ?? '空空如也',
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xff555555))),
              padding: EdgeInsets.only(top: widget.cont == null ? 0 : 15),
            )
          ],
        ),
      ),
    );
  }
}
