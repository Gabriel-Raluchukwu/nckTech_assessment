import '../Utils/constants.dart' as blog;

class Blog{
  final int id;
  final String title;
  final String description;
  final String image;
  final String createdAt;
  final String updatedAt;

  Blog({this.id,this.title,this.description,this.image,this.createdAt,this.updatedAt});

  factory Blog.fromJson(Map<String,dynamic> json){
    return Blog(
      id: json[blog.idProperty],
      title: json[blog.titleProperty],
      description: json[blog.descriptionProperty],
      image: json[blog.imageProperty],
      createdAt: json[blog.createdProperty],
      updatedAt: json[blog.updatedProperty]
    );
  }
}