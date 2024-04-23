import 'package:flutter/material.dart';

class StickyBottomBar extends StatelessWidget {
  final Widget child;
  const StickyBottomBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
      child: child,
    );
  }
}
