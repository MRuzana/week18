import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:bloc_post_sample/features/posts/models/post_data_model.dart';

class PostRepo {
  static Future<List<PostDataModel>> fetchpost() async {
    List<PostDataModel> posts = [];

    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      List decodedData = jsonDecode(response.body);

      for (int i = 0; i < decodedData.length; i++) {
        PostDataModel post = PostDataModel.fromJson(decodedData[i]);
        posts.add(post);
      }

      return posts;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }



  static Future<bool> addPost() async {
   

    try {
      final response = await http
          .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),

          body: {
            'title': 'Ruzana',
            'body': 'she is a flutter developer',
            'userId': '120'

          }
        );

      if(response.statusCode >= 200 && response.statusCode < 300){
        return true;
      }
      else{
        return false;
      }  
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
