import 'package:flutter/material.dart';
import 'package:calculator/utilities/calcbutton.dart';

KeyContainer switchMode() {
  return KeyContainer(
      darkMode: darkMode,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.wb_sunny,
              color: darkMode ? Colors.grey : Colors.redAccent,
            ),
            Icon(
              Icons.nightlight,
              color: darkMode ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ));
}
