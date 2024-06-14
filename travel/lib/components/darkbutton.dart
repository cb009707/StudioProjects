import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final Color? color;
  final void Function ()? onTap;

  const button({super.key, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),

    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Change"),
    ),
      ),
    );
  }
}