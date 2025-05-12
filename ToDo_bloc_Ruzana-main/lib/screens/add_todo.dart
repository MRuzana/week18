import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/bloc/bloc/todo_bloc.dart';
import 'package:to_do_app/model/todo_model.dart';
// ignore: must_be_immutable
class AddTodoScreen extends StatelessWidget {
  final TodoModel? todoList;
  AddTodoScreen({super.key, this.todoList});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    if (todoList != null) {
      isEdit = true;
      titleController.text = todoList!.title;
      descriptionController.text = todoList!.description;
    }
    return Scaffold(
      appBar: AppBar(
        title: isEdit ? const Text('Edit Todo') : const Text('Add ToDo'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: descriptionController,
                minLines: 5,
                maxLines: 8,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    hintText: 'Description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ))),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue)),
                      onPressed: () {
                        submitForm(context);
                      },
                      child: isEdit
                          ? const Text(
                              'UPDATE',
                              style: TextStyle(color: Colors.black),
                            )
                          : const Text(
                              'SUBMIT',
                              style: TextStyle(color: Colors.black),
                            )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> submitForm(BuildContext context) async {
    final TodoModel todo;
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();

    if (isEdit) {
      final id = todoList!.id;
      todo = TodoModel(title: title, description: description, id: id);
      
      context.read<TodoBloc>().add(EditToDoEvents(todoModel: todo));
      Navigator.pop(context);
      context.read<TodoBloc>().add(TodoInitialFetechingEvents());
      
    } else {
      todo = TodoModel(title: title, description: description);
      context.read<TodoBloc>().add(AddToDoEvents(todoModel: todo));
      Navigator.pop(context);
      context.read<TodoBloc>().add(TodoInitialFetechingEvents());
    }
  }
}
