part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class TodoInitialFetechingEvents extends TodoEvent{}

class AddToDoEvents extends TodoEvent {
  final TodoModel todoModel;
  AddToDoEvents({
    required this.todoModel,
  });
}

class EditToDoEvents extends TodoEvent{
  final TodoModel todoModel;
  EditToDoEvents({
    required this.todoModel,
  });
}

class DeleteToDoEvents extends TodoEvent{
  final String id;

  DeleteToDoEvents({required this.id});
}
