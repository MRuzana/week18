part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

abstract class ToDoActionState extends TodoState {}

class ToDoFetchingLoadingState extends TodoState {}

class ToDoFetchingSuccessfulState extends TodoState {
  final List<TodoModel> todoList;

  ToDoFetchingSuccessfulState({required this.todoList});
}

class ToDoFetchingErrorState extends TodoState {
  final String errorMessage;

  ToDoFetchingErrorState({required this.errorMessage});
}

class ToDoAddSuccessState extends ToDoActionState {}

class ToDoAddErrorState extends ToDoActionState {
  final String errorMessage;

  ToDoAddErrorState({required this.errorMessage});
}

class ToDoEditSuccessState extends ToDoActionState {}

class ToDoEditErrorState extends ToDoActionState {
  final String errorMessage;

  ToDoEditErrorState({required this.errorMessage});
}
class ToDoDeleteSuccessState extends ToDoActionState {}

class ToDoDeleteErrorState extends ToDoActionState {
  final String errorMessage;

  ToDoDeleteErrorState({required this.errorMessage});
}