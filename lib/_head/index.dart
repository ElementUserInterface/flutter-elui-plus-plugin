/// 同步 - AppBar

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
class EluiAppBarComponent extends StatefulWidget
    implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final String? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final String? backImgName;
  final bool isBack;
  BuildContext context;

  EluiAppBarComponent({
    Key? key,
    this.bottom,
    this.title,
    this.centerTitle = true,
    required this.context,
    this.actions,
    this.titleStyle,
    this.backgroundColor,
    this.backImgName,
    this.isBack = true,
  }) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(bottom != null ? 91 : 45);
}

class _MyAppBarState extends State<EluiAppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title ?? 'title',
        style: widget.titleStyle ??
            const TextStyle(
              color: Colors.black,
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
      ),
      centerTitle: widget.centerTitle,
      leading: widget.isBack
          ? TextButton(
              child: const Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.pop(widget.context);
              },
            )
          : null,
      backgroundColor: widget.backgroundColor ?? Colors.white,
      elevation: 0,
      bottom: AppBarBottom(
        child: widget.bottom,
      ),
      actions: widget.actions,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}

class AppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  final Widget? child;

  const AppBarBottom({
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 1,
          color: const Color(0xFFf2f2f2),
        ),
        child ??
            const SizedBox(
              height: 0,
            ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(child != null ? 47 : 1);
}