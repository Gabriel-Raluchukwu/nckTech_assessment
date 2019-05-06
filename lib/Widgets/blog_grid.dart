import 'package:flutter/material.dart';


import '../Utils/utility_functions.dart';
import '../Model/Blog.dart';
//import '../Pages/fetch_blog_details_page.dart';
import '../Pages/blog_details_page.dart';

num _gridSpacing = 8.0;

class BlogGrid extends StatefulWidget {
  final List<Blog> blogs;

  BlogGrid({Key key,this.blogs}): super( key: key );

  @override
  _BlogGridState createState() => _BlogGridState();
}

class _BlogGridState extends State<BlogGrid> {
  List<Blog> blogs;

  @override
  void initState() {
    blogs = widget.blogs;
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {

    final double height = (MediaQuery.of(context).size.height - kToolbarHeight - 24)/2;
    final double width = MediaQuery.of(context).size.width/2;
    return GridView.builder(
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: width/height,
        crossAxisCount: 2,
      ),
      itemCount: blogs.length,
      itemBuilder: (BuildContext context,int index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => BlogDetailsPage(blog: blogs[index]),
            //Navigator.push(context,MaterialPageRoute(builder: (context) => FetchBlogDetailsPage(blogs[index].id),
              ),
            );
          },
            child: Hero(
              tag: blogs[index].id,
              child: Container(
              margin: EdgeInsets.all(_gridSpacing),
              child:Column(
                children: <Widget>[
                  //Image
                  SizedBox(
                    width: double.infinity,
                    height: 230.0,
                    child: Image.memory(
                      convertToImage(blogs[index].image),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      blogs[index].title,
                      style:TextStyle(
                        color: Colors.white,
                        fontWeight:FontWeight.bold,
                      ),
                    ),
                  ),
                ]
              ),
             ),
          ),
        );
      },
    );
  }
}

