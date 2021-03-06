import 'package:flutter/material.dart';

import '../Model/Blog.dart';
import '../Utils/utility_functions.dart';
import '../Widgets/load_indicator.dart';
import '../Widgets/Error.dart';

class FetchBlogDetailsPage extends StatelessWidget {
  final int blogId;

  FetchBlogDetailsPage(this.blogId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: SafeArea(
      child: FutureBuilder<Blog>(
        future: fetchBlogDetail(blogId) ,
        builder: (BuildContext context,AsyncSnapshot<Blog> snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircleLoadingIndicator());

            case ConnectionState.done:
              if(snapshot.hasError){
                return ErrorDisplay();
              }  
              return SingleChildScrollView(
                child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 350.0,
                    child: Image.memory(convertToImage(snapshot.data.image),fit: BoxFit.fill,),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: _DateDisplay(dateTime: snapshot.data.createdAt,),),
                    _Title(title:snapshot.data.title),
                    _Body(body: snapshot.data.description,),          
                  ],
                )
              );
            }
          }
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