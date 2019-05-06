import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './Pages/blog_home_page.dart';

void main(){
  runApp(Blog());
 
  }

class Blog extends StatelessWidget {
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          elevation: 1.0,
          color: Colors.grey[900],
          textTheme: TextTheme(
            title: TextStyle(color: Colors.white,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal,
                  ),
            ),
          ),
        
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => BlogHomePage(),
      },
    );
  }
}