import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/model/todo_model.dart';
import 'package:to_do_app/repos/todo_repo.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TodoInitialFetechingEvents>(todoInitialFetechingEvents);
    on<AddToDoEvents>(addToDoEvents);
    on<EditToDoEvents>(editToDoEvents);
    on<DeleteToDoEvents>(deleteToDoEvents);
  }

  FutureOr<void> todoInitialFetechingEvents(
      TodoInitialFetechingEvents event, Emitter<TodoState> emit) async {
        emit(ToDoFetchingLoadingState());
    try {
      List<TodoModel> todoList = await TodoRepo().getAllToDo();
      emit(ToDoFetchingSuccessfulState(todoList: todoList));
    } catch (e) {
      emit(ToDoFetchingErrorState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> addToDoEvents(
      AddToDoEvents event, Emitter<TodoState> emit) async {
    try {
      await TodoRepo().addToDo();
      emit(ToDoAddSuccessState());
    } catch (e) {
      emit(ToDoAddErrorState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> editToDoEvents(
      EditToDoEvents event, Emitter<TodoState> emit) async {
    try {
      await TodoRepo().updateData();
      emit(ToDoEditSuccessState());
    } catch (e) {
      emit(ToDoEditErrorState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> deleteToDoEvents(
      DeleteToDoEvents event, Emitter<TodoState> emit) async {
         try {
    // Delete the todo item
    await TodoRepo().deleteToDo(event.id);

    // Fetch the updated list
    List<TodoModel> updatedList = await TodoRepo().getAllToDo();

    // Emit the updated list state
    emit(ToDoFetchingSuccessfulState(todoList: updatedList));

   

    // Emit the delete success state
    emit(ToDoDeleteSuccessState());
  } catch (e) {
    // Emit the error state if something goes wrong
    emit(ToDoDeleteErrorState(errorMessage: e.toString()));
  }




    // try {
    //   await TodoRepo().deleteToDo(event.id);
     
    //   List<TodoModel> updatedList = await TodoRepo().getAllToDo();
      
    //   emit(ToDoFetchingSuccessfulState(todoList: updatedList)); 
    //    emit(ToDoDeleteSuccessState());
     
    // } catch (e) {
    //   emit(ToDoDeleteErrorState(errorMessage: e.toString()));
    // }
  }
}
