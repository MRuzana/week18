// import 'package:flutter/material.dart';
// import 'package:to_do_app/model/todo_model.dart';


// class Api {
//   List items = [];

//   final TodoModel? todoModel;
//   final BuildContext? context;

//   Api({this.todoModel, this.context});

  // Future<void> submitAddData() async {
  //   String title = todoModel!.title;
  //   String description = todoModel!.description;

  //   final body = {
  //     'title': title,
  //     'description': description,
  //     'is_completed': false
  //   };
  //   final response = await http.post(
  //       Uri.parse('https://api.nstack.in/v1/todos'),
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode(body));

  //   if (response.statusCode == 201) {
  //     showSucccessMessage('Data sent successfully');
  //     Navigator.of(context!)
  //         .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  //   } else {
  //     showErrorMessage('Data send failed');
  //   }
  // }

  // Future<void> updateData()async{

  //   String title = todoModel!.title;
  //   String description = todoModel!.description;
  //   String id = todoModel!.id!;

  //   final body = {
  //     'title': title,
  //     'description': description,
  //     '_id':id,
  //     'is_completed': false
  //   };
  //   final response = await http.put(
  //       Uri.parse('https://api.nstack.in/v1/todos/$id'),
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode(body));

  //   if (response.statusCode == 200) {
  //     showSucccessMessage('Data updated successfully');
  //     Navigator.of(context!)
  //         .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  //   } else {
  //     showErrorMessage('Data send failed');
  //   }
  // }

  

  // void showSucccessMessage(String message) {
  //   final snackBar = SnackBar(
  //     content: Text(message),
  //     backgroundColor: Colors.green,
  //   );
  //   ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  // }

  // void showErrorMessage(String message) {
  //   final snackBar = SnackBar(
  //     content: Text(message),
  //     backgroundColor: Colors.red,
  //   );
  //   ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  // }

  // Future<List<TodoModel>> getAllToDo() async {
  //   final response = await http
  //       .get(Uri.parse('https://api.nstack.in/v1/todos?page=5&limit=10'));
  //   if (response.statusCode == 200) {
  //     final decodedData = json.decode(response.body)['items'] as List;
  //     return decodedData.map((todo) => TodoModel.fromJson(todo)).toList();
  //   } else {
  //     throw Exception('Something happened');
  //   }
  // }

  // Future<void>deletebyId(String id)async{
  //   final response = await http.delete(Uri.parse('https://api.nstack.in/v1/todos/$id'));
  // }
//}

 
  














