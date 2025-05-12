import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do_app/model/todo_model.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_app/screens/home_screen.dart';

class TodoRepo {

  final TodoModel? todoModel;
  final BuildContext? context;

  TodoRepo({this.todoModel, this.context});

  Future<List<TodoModel>> getAllToDo() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.nstack.in/v1/todos?page=5&limit=10'));

      final decodedData = json.decode(response.body)['items'] as List;
      return decodedData.map((todo) => TodoModel.fromJson(todo)).toList();

    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<void> addToDo() async {
    String title = todoModel!.title;
    String description = todoModel!.description;

    final body = {
      'title': title,
      'description': description,
      'is_completed': false
    };
    final response = await http.post(
        Uri.parse('https://api.nstack.in/v1/todos'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body));

    if (response.statusCode == 201) {
      showSucccessMessage('Data sent successfully');
      Navigator.of(context!)
          .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      showErrorMessage('Data send failed');
    }
  }

   void showSucccessMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  }

  void showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  }

 
 Future<void> updateData()async{

    String title = todoModel!.title;
    String description = todoModel!.description;
    String id = todoModel!.id!;

    final body = {
      'title': title,
      'description': description,
      '_id':id,
      'is_completed': false
    };
    final response = await http.put(
        Uri.parse('https://api.nstack.in/v1/todos/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      showSucccessMessage('Data updated successfully');
      Navigator.of(context!)
          .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      showErrorMessage('Data send failed');
    }
  }

   Future<void>deleteToDo(String id)async{
    
     await http.delete(Uri.parse('https://api.nstack.in/v1/todos/$id'));
    // if(response.statusCode == 200){
    //    showSucccessMessage('Data deleted');
    // }
    // else{
    //   showErrorMessage('Deletion failed');
    // }
   
  }




}
