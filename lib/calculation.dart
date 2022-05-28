import 'package:flutter/material.dart';
import 'utilities/calcbutton.dart';

class Calculation extends StatefulWidget {
  const Calculation({Key? key}) : super(key: key);

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? darkColor : lightColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Output Container
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '646445646546546546464.05',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: darkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '=',
                          style: TextStyle(
                            fontSize: 25,
                            color: darkMode ? Colors.green : Colors.grey,
                          ),
                        ),
                        Text(
                          '4656465.05',
                          style: TextStyle(
                            fontSize: 25,
                            color: darkMode ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              //Keys Container
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(
                          title: 'C',
                          textColor: darkMode ? Colors.green : Colors.redAccent),
                        _buttonRounded(
                          title: '%',
                          textColor: darkMode ? Colors.green : Colors.redAccent),
                        _buttonRounded(
                          icon: Icons.backspace_outlined,
                          iconColor: darkMode ? Colors.green : Colors.redAccent),
                        _buttonRounded(
                          title: '/',
                          textColor: darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: '7'),
                        _buttonRounded(title: '8'),
                        _buttonRounded(title: '9'),
                        _buttonRounded(
                          icon: Icons.clear_rounded,
                          iconColor: darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: '4'),
                        _buttonRounded(title: '5'),
                        _buttonRounded(title: '6'),
                        _buttonRounded(
                          icon: Icons.remove,
                          iconColor: darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: '1'),
                        _buttonRounded(title: '2'),
                        _buttonRounded(title: '3'),
                        _buttonRounded(
                          icon: Icons.add_rounded,
                          iconColor: darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: '00'),
                        _buttonRounded(title: '0'),
                        _buttonRounded(title: '.'),
                        _buttonRounded(
                          title: '=',
                          textColor: darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                  ],
                ),

              ),
            ],
          ),
          ),
        ),
    );
  }

  Widget _buttonRounded(
    {String? title, double padding = 20, IconData? icon, Color? iconColor, Color? textColor}){
    return KeyContainer(
      darkMode: darkMode,
      borderRadius: BorderRadius.circular(40),
      padding: EdgeInsets.all(padding),
      child: Container(
        width: padding * 2,
        height: padding * 2,
        child: Center(
          child: title != null
          ? Text(title,
              style: TextStyle(
                color: textColor != null 
                ? textColor 
                : darkMode ? Colors.white : Colors.black,
                fontSize: 30,
                ),
              )
          : Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
        ),
      ),
    );
  }
}