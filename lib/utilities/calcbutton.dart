// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

const Color darkColor = Color(0xFF374352);
const Color lightColor = Color(0xFFe6eeff);
bool darkMode = false;

class KeyContainer extends StatefulWidget {
  final bool darkMode;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  const KeyContainer(
      {this.darkMode = false,
      required this.child,
      required this.borderRadius,
      required this.padding});

  @override
  State<KeyContainer> createState() => _KeyContainerState();
}

class _KeyContainerState extends State<KeyContainer> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: widget.padding,
        decoration: BoxDecoration(
          color: darkMode ? darkColor : lightColor,
          borderRadius: widget.borderRadius,
          boxShadow: _isPressed
              ? null
              : [
                  BoxShadow(
                    color: darkMode ? Colors.black54 : Colors.blueGrey.shade200,
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: darkMode ? Colors.blueGrey.shade700 : Colors.white,
                    offset: const Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                ],
        ),
        child: widget.child,
      ),
    );
  }
}
