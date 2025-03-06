import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    super.key,
    required this.child,
    this.color,
    this.borderRadius,
    this.onTap
  });

  final Function()? onTap;
  final Widget child;
  final Color? color;
  final double? borderRadius;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius ?? 15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 24),
          child: widget.child,
        ),
      ),
    );
  }
}
