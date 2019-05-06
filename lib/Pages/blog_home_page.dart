import 'package:flutter/material.dart';

import '../Model/Blog.dart';
import '../Widgets/blog_grid.dart';
import '../Utils/utility_functions.dart';
import '../Widgets/load_indicator.dart';
import '../Widgets/Error.dart';

class BlogHomePage extends StatefulWidget{

  @override
  _BlogHomePageState createState() => _BlogHomePageState();
}

class _BlogHomePageState extends State<BlogHomePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        centerTitle: true,
        ),
        backgroundColor: Colors.grey[700],
        body: FutureBuilder<List<Blog>>(
          future:fetchBlogData() ,
          builder: (BuildContext context,AsyncSnapshot<List<Blog>> snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                child: CircleLoadingIndicator()
                );
              case ConnectionState.done:
                if(snapshot.hasError){
                  return ErrorDisplay(errorMessage: snapshot.error,);
                }

                return SizedBox.expand(
                  child: snapshot.hasData ?
                  BlogGrid(blogs: snapshot.data) :
                  Center(
                    child: CircleLoadingIndicator(),
                  ),
                );
            } 
          },
        )
      ); 
    }
}
