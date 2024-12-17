import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  final Widget child;

  const Card({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 30, left: 30),
      child: child,
    );
  }
}
