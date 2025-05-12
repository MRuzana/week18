import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/bloc/bloc/todo_bloc.dart';
import 'package:to_do_app/screens/add_todo.dart';
import 'package:to_do_app/widget/widget_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final TodoBloc todoBloc = TodoBloc();
    todoBloc.add(TodoInitialFetechingEvents());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),

      body: BlocConsumer<TodoBloc,TodoState>(
        bloc: todoBloc,
        listenWhen: (previous, current) => current is ToDoActionState,
        buildWhen: (previous, current) => current is !ToDoActionState || current is ToDoFetchingSuccessfulState,
        listener: (context,state){

          if (state is ToDoDeleteSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Todo deleted successfully')),
            );
          } else if (state is ToDoDeleteErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to delete todo: ${state.errorMessage}')),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {

            case ToDoFetchingLoadingState:
              return const Center(child: CircularProgressIndicator());

            case ToDoFetchingSuccessfulState:
              final successState = state as ToDoFetchingSuccessfulState;
              return  WidgetListview(successState: successState);
            
            case ToDoFetchingErrorState:
              final errorState = state as ToDoFetchingErrorState;
              return Center(child: Text('Failed to load products: ${errorState.errorMessage}'));

            default :
              return const SizedBox();
          }

          
        },
      ),

      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        
        //backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddTodoScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

