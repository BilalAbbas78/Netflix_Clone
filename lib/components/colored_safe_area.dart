import 'package:flutter/material.dart';

class ColoredSafeArea extends StatelessWidget {
  final Widget child;

  const ColoredSafeArea({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      // color: Theme.of(context).colorScheme.primaryContainer,
      child: SafeArea(
        child: child,
      ),
    );
  }
}