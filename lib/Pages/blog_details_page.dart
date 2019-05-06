import 'package:flutter/material.dart';

import '../Model/Blog.dart';
import '../Utils/utility_functions.dart';

class BlogDetailsPage extends StatelessWidget {
final Blog blog;

BlogDetailsPage({@required this.blog}):assert(blog != null);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

        home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: SafeArea(
        child: Hero(
          tag: blog.id,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 350.0,
                  child: Image.memory(convertToImage(blog.image),fit: BoxFit.fill,),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: _DateDisplay(dateTime: blog.createdAt,),),
                  _Title(title: blog.title),
                  _Body(body: blog.description,),          
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DateDisplay extends StatelessWidget{
final String dateTime;

_DateDisplay({@required this.dateTime}):assert(dateTime != null);

@override
Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(14.0),
      child: Text(formatDate(dateTime),
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
      ),),
    );
  }
}
class _Title extends StatelessWidget{
  final String title;

  _Title({@required this.title}):assert(title != null);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(14.0),
      child: Text(title,
      style:TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        ),
      ),
    );
  }  
}


class _Body extends StatelessWidget{
  final String body;

  _Body({@required this.body}):assert(body != null);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(14.0),
      child: Text(body,
       style:TextStyle(
         fontSize: 18.0,
         fontWeight: FontWeight.normal,
         color: Colors.white
         ),
        softWrap: true,
      ),
    );
  }  
}