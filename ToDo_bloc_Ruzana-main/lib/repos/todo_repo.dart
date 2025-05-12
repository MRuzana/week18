import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:to_do_app/model/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoRepo {

  Future<List<TodoModel>> getAllToDo() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.nstack.in/v1/todos?page=1&limit=10'));

      final decodedData = json.decode(response.body)['items'] as List;
      return decodedData.map((todo) => TodoModel.fromJson(todo)).toList();
    } catch (e) {
      log(e.toString());
      
    }
    return [];
  }

  Future<int> addToDo({required TodoModel? todoModel}) async {
    String title = todoModel!.title;
    String description = todoModel.description;

    final body = {
      'title': title,
      'description': description,
      'is_completed': false
    };
    final response = await http.post(
        Uri.parse('https://api.nstack.in/v1/todos'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body));
    debugPrint(response.statusCode.toString());
    return response.statusCode;
  }

  Future<int> updateData({required TodoModel? todoModel}) async {
    final response = await http.put(
        Uri.parse('https://api.nstack.in/v1/todos/${todoModel?.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(todoModel?.toJson()));
    debugPrint(response.statusCode.toString());

    return response.statusCode;
  }

  Future<int> deleteToDo(String id) async {
    final response =
        await http.delete(Uri.parse('https://api.nstack.in/v1/todos/$id'));
    debugPrint(response.statusCode.toString());
    return response.statusCode;
  }
}
