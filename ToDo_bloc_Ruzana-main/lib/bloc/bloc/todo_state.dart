part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

class ToDoFetchingLoadingState extends TodoState {}

class ToDoFetchingSuccessfulState extends TodoState {
  final List<TodoModel> todoList;

  ToDoFetchingSuccessfulState({required this.todoList});
}

class TodoErrorState extends TodoState{
  final String message;

  TodoErrorState({required this.message});
}

class TodoResponseState extends TodoState {
  final String message;

  TodoResponseState({required this.message});
}

