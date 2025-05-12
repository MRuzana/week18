part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class TodoInitialFetechingEvents extends TodoEvent{}

class AddToDoEvents extends TodoEvent{}

class EditToDoEvents extends TodoEvent{}

class DeleteToDoEvents extends TodoEvent{
  final String id;

  DeleteToDoEvents({required this.id});
}
