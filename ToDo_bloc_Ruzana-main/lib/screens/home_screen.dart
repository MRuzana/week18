import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/bloc/bloc/todo_bloc.dart';
import 'package:to_do_app/screens/add_todo.dart';
import 'package:to_do_app/widget/widget_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is TodoResponseState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            
          }
        },
        builder: (context, state) {
          if (state is ToDoFetchingLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoErrorState) {
            return 
            Center(
                child: Text(state.message,));
          } else if (state is ToDoFetchingSuccessfulState) {
            debugPrint(state.todoList.length.toString());
            return WidgetListview(successState: state);
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),

        //backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddTodoScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
