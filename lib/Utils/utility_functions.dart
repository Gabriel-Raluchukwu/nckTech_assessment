import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../Model/Blog.dart';
import '../Utils/constants.dart';


Future<List<Blog>> fetchBlogData() async{
  final response = await http.get(baseURL);

  return compute(parseBlog,response.body);
}

List<Blog> parseBlog(String responseBody){
  final parsedData = json.decode(responseBody).cast<Map<String,dynamic>>();

  return parsedData.map<Blog>((json) => Blog.fromJson(json)).toList();

}

Future<Blog> fetchBlogDetail(int blogNumber) async{
  final String url = getBlogURL + '/$blogNumber';
  final response = await http.get(url);

  if(response.statusCode == 200){
  return Blog.fromJson(json.decode(response.body));
  }
  return null;

}

Uint8List convertToImage(String encodedImage){
  Uint8List bytes = base64Decode(encodedImage);
  return bytes;
}

String formatDate(String date){
  DateTime dateTime = DateTime.parse(date);
  DateFormat dateFormat = DateFormat("MMMM dd, yyyy 'at' hh:mm a");
  return dateFormat.format(dateTime);

}