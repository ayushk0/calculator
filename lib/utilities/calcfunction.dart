import 'package:flutter/material.dart';
import 'calcbutton.dart';

class buttonRounded extends StatefulWidget {
  final String? title;
  final double padding = 20;
  final IconData? icon;
  final Color? iconColor;
  final Color? textColor;

  const buttonRounded({
    this.title,
    this.icon,
    this.iconColor,
    this.textColor,
  });

  @override
  State<buttonRounded> createState() => _buttonRoundedState();
}

class _buttonRoundedState extends State<buttonRounded> {
  String result='0';
  String previousNumber='';
  String currentNumber='';
  String selectedOperation='';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if(widget.title==null){
          if(widget.icon==Icons.add_rounded){
            if(previousNumber !=''){
              _calculateResult();
            } else {
              previousNumber = currentNumber;
            }
            currentNumber = '';
            selectedOperation = '+';
          }
          else if(widget.icon==Icons.remove){
            if(previousNumber !=''){
              //calculate result
            } else {
              previousNumber = currentNumber;
            }
            currentNumber = '';
            selectedOperation = '-';
          }
        }
        else{
          switch (widget.title) {
            case '=':
              _calculateResult();
              previousNumber = '';
              selectedOperation = '';
              break;
            case '/':
              print("/ is pressed");
              break;
            case '%':
              currentNumber = (convertStringToDouble(currentNumber) / 100).toString();
              result = currentNumber;
              break;
            case 'C':
              result = '0';
              previousNumber = '';
              currentNumber = '';
              selectedOperation = '';
              break;
            default:
              currentNumber = currentNumber + widget.title!;
              result = currentNumber;
          }
        }
        });
        
      },
      child: KeyContainer(
        darkMode: darkMode,
        borderRadius: BorderRadius.circular(40),
        padding: EdgeInsets.all(widget.padding),
        child: Container(
          width: widget.padding * 2,
          height: widget.padding * 2,
          child: Center(
            child: widget.title != null
            ? Text(widget.title!,
                style: TextStyle(
                  color: widget.textColor != null 
                  ? widget.textColor 
                  : darkMode ? Colors.white : Colors.black,
                  fontSize: 30,
                  ),
                )
            : Icon(
              widget.icon,
              color: widget.iconColor,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
  
  void _calculateResult() {}
  
  double convertStringToDouble(String number) {
    return double.tryParse(number) ?? 0;
  }
}