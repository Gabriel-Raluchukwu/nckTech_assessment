import 'package:flutter/material.dart';

class CircleLoadingIndicator extends StatelessWidget{
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      CircularProgressIndicator(),
      SizedBox(height: 16.0,),
      Text('Loading...',
        style:TextStyle(
          fontSize: 16.0,
          fontStyle: FontStyle.italic,
          color: Colors.white
          ),
        )
    ],
              );
  }
}