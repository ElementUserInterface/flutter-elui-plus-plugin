/// 图片

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_elui_plugin/elui.dart';

/// 图片主题
class EluiImgTheme {
  final Color? backgroundColor;

  EluiImgTheme({
    this.backgroundColor,
  });
}

class EluiImgComponent extends StatefulWidget {
  final String? src;

  final EluiImgTheme? theme;

  final double width;

  final double height;

  final BoxFit fit;

  final Widget? errorWidget;

  final bool isPlaceholder;

  final PlaceholderWidgetBuilder? placeholder;

  const EluiImgComponent({
    Key? key,
    this.src = "http://via.placeholder.com/200x150",
    this.theme,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.cover,
    this.errorWidget = const Icon(Icons.error),
    this.isPlaceholder = false,
    this.placeholder,
  }) : super(key: key);

  @override
  _EluiImgComponentState createState() => _EluiImgComponentState();
}

class _EluiImgComponentState extends State<EluiImgComponent> {
  @override
  Widget build(BuildContext context) {
    EluiImgTheme? _theme = widget.theme;

    return CachedNetworkImage(

      color: _theme?.backgroundColor,
      imageUrl: widget.src!,
      width: widget.width,
      height: widget.height,
      imageBuilder: (context, imageProvider) =>
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: widget.fit,
              ),
            ),
          ),
      placeholder: widget.placeholder ??
              (BuildContext context, String url) {
            return const ELuiLoadComponent(
              type: "line",
              color: Color(0xffaaaaaa),
              lineWidth: 2,
              size: 20,
            );
          },
      errorWidget: (context, url, error) {
        return widget!.errorWidget! == null ? Icon(Icons.error) : widget!.errorWidget!;
      },
    );
  }
}
