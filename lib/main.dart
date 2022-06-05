import 'package:flutter/material.dart';

import 'calculation.dart';

void main()
{
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,      
      initialRoute: "/home",
      routes:{
        "/home":(context) => const Calculation(),
      }
    );
  }
}