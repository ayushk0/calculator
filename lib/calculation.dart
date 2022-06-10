import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'utilities/calcbutton.dart';
import 'utilities/switchMode.dart';

class Calculation extends StatefulWidget {
  const Calculation({Key? key}) : super(key: key);

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  bool hideResult = true;

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
              //Mode Switcher
              GestureDetector(
                  onTap: () => setState(() {
                        darkMode ? darkMode = false : darkMode = true;
                      }),
                  child: switchMode()),
              const SizedBox(
                height: 80,
              ),
              //Output Container
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  hideResult
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              currentNumber,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: currentNumber.length > 10 ? 40 : 50,
                                color: darkMode ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '=  ',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: darkMode
                                      ? Colors.green
                                      : Colors.redAccent,
                                ),
                              ),
                              Text(
                                result,
                                style: TextStyle(
                                  fontSize: result.length > 10 ? 30 : 40,
                                  fontWeight: FontWeight.bold,
                                  color: darkMode
                                      ? Colors.green
                                      : Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
              //Keys Container
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buttonRounded(
                            title: 'C',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                        _buttonRounded(
                            title: '%',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                        _buttonRounded(
                            icon: Icons.backspace_outlined,
                            iconColor:
                                darkMode ? Colors.green : Colors.redAccent),
                        _buttonRounded(
                            title: '÷',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: '7'),
                        _buttonRounded(title: '8'),
                        _buttonRounded(title: '9'),
                        _buttonRounded(
                            title: '×',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: '4'),
                        _buttonRounded(title: '5'),
                        _buttonRounded(title: '6'),
                        _buttonRounded(
                            title: '–',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: '1'),
                        _buttonRounded(title: '2'),
                        _buttonRounded(title: '3'),
                        _buttonRounded(
                            title: '+',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
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
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
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

  //Adding Functions to buttons
  String result = '0';
  String currentNumber = '';
  String equation = '';

  Widget _buttonRounded(
      {String? title,
      double padding = 20,
      IconData? icon,
      Color? iconColor,
      Color? textColor}) {
    return GestureDetector(
      onTap: () {
        setState(() {});
        if (title == null) {
          if (icon == Icons.backspace_outlined) {
            if (currentNumber.isNotEmpty) {
              currentNumber =
                  currentNumber.substring(0, currentNumber.length - 1);
            }
          }
        } else {
          switch (title) {
            case '=':
              //Calculating Result
              equation = currentNumber;
              equation = equation.replaceAll('×', '*');
              equation = equation.replaceAll('÷', '/');
              equation = equation.replaceAll('–', '-');
              hideResult = false;

              try {
                Parser p = Parser();
                Expression exp = p.parse(equation);

                ContextModel cm = ContextModel();
                result = '${exp.evaluate(EvaluationType.REAL, cm)}';
              } catch (e) {
                result = 'Error!';
              }

              currentNumber = result;
              break;
            case '%':
              currentNumber =
                  (convertStringToDouble(currentNumber) / 100).toString();
              result = currentNumber;
              break;
            case 'C':
              result = '0';
              currentNumber = '';
              equation = '';
              hideResult = true;
              break;
            default:
              currentNumber = currentNumber + title;
              result = currentNumber;
              hideResult = true;
          }
        }
      },
      child: KeyContainer(
        darkMode: darkMode,
        borderRadius: BorderRadius.circular(40),
        padding: EdgeInsets.all(padding),
        child: SizedBox(
          width: padding * 2,
          height: padding * 2,
          child: Center(
            child: title != null
                ? Text(
                    title,
                    style: TextStyle(
                      color:
                          textColor ?? (darkMode ? Colors.white : Colors.black),
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
      ),
    );
  }

  double convertStringToDouble(String number) {
    return double.tryParse(number) ?? 0;
  }
}
