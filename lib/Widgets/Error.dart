import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget{
static const String defaultErrorMessage = 'An error occured. Please make sure you are connected to the Internet';
final String errorMessage;

ErrorDisplay({this.errorMessage = defaultErrorMessage});

  @override
  Widget build(BuildContext context){
    return 
     Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(errorMessage,
        style: TextStyle(
          color: Colors.red,
          fontSize: 18.0,
            ),
          ),
      ),
    );
  }
}