import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/model/todo_model.dart';
import 'package:to_do_app/repos/todo_repo.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepo todoRepo;
  TodoBloc(this.todoRepo) : super(TodoInitial()) {
    on<TodoInitialFetechingEvents>(todoInitialFetechingEvents);
    on<AddToDoEvents>(addToDoEvents);
    on<EditToDoEvents>(editToDoEvents);
    on<DeleteToDoEvents>(deleteToDoEvents);
  }

  FutureOr<void> todoInitialFetechingEvents(
      TodoInitialFetechingEvents event, Emitter<TodoState> emit) async {
    emit(ToDoFetchingLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 2));
      List<TodoModel> todoList = await TodoRepo().getAllToDo();
      emit(ToDoFetchingSuccessfulState(todoList: todoList));
    } catch (e) {
      emit(TodoErrorState(message: e.toString()));
    }
  }

  FutureOr<void> addToDoEvents(
      AddToDoEvents event, Emitter<TodoState> emit) async {
    try {
      final statusCode = await todoRepo.addToDo(todoModel: event.todoModel);
      if (statusCode == 201) {
      debugPrint(event.todoModel.toString());
        emit(TodoResponseState(message: "Added successfully"));
      } else {
        emit(TodoResponseState(message: "Unable to add"));
      }
    } catch (e) {
      emit(TodoErrorState(message: e.toString()));
    }
  }

  FutureOr<void> editToDoEvents(
      EditToDoEvents event, Emitter<TodoState> emit) async {
    try {
      final statusCode = await todoRepo.updateData(todoModel: event.todoModel);
      if (statusCode == 200) {
        emit(TodoResponseState(message: "Edited successfully"));
      } else {
        emit(TodoResponseState(message: "Unable to edit"));
      }
    } catch (e) {
      emit(TodoErrorState(message: e.toString()));
    }
  }

  FutureOr<void> deleteToDoEvents(
      DeleteToDoEvents event, Emitter<TodoState> emit) async {
    try {
      // Delete the todo item
      final statusCode = await todoRepo.deleteToDo(event.id);

      if (statusCode == 200) {
        emit(TodoResponseState(message: "Deleted successfully"));
      } else {
        emit(TodoResponseState(message: "Unable to delete"));
      }
    } catch (e) {
      emit(TodoErrorState(message: e.toString()));
    }
  }
}
