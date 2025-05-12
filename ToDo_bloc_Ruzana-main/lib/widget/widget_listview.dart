import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/bloc/bloc/todo_bloc.dart';
import 'package:to_do_app/screens/add_todo.dart';

class WidgetListview extends StatelessWidget {
  const WidgetListview({
    super.key,
    required this.successState,
  });

  final ToDoFetchingSuccessfulState successState;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: successState.todoList.isNotEmpty,
      replacement: const Center(child: Text("No todos Added"),),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(successState.todoList[index].title),
              subtitle: Text(successState.todoList[index].description),
              trailing: Column(
                children: [
                  Expanded(
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddTodoScreen(
                                      todoList: successState.todoList[index],
                                    )));
                          },
                          icon: const Icon(Icons.edit))),
                  Expanded(
                      child: IconButton(
                          onPressed: () {
                            context.read<TodoBloc>().add(DeleteToDoEvents(
                                id: successState.todoList[index].id!));
                                context.read<TodoBloc>().add(TodoInitialFetechingEvents());
                          },
                          
                          icon: const Icon(Icons.delete))),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: successState.todoList.length),
    );
  }
}






















// class WidgetListview extends StatelessWidget {
//   const WidgetListview({
//     super.key,
//     required this.successState,
//   });

//   final ToDoFetchingSuccessfulState successState;

  

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
      
//       itemBuilder: (context,index){
//         return ListTile(
//           leading: CircleAvatar(
//             child: Text('${index+1}'),
//           ),
//           title: Text(successState.todoList[index].title),
//           subtitle: Text(successState.todoList[index].description),
//           trailing: Column(
//             children: [
//               Expanded(child: IconButton(onPressed: (){
//                  Navigator.of(context).push(
//               MaterialPageRoute(builder: (context) => AddTodoScreen(todoList: successState.todoList[index],)));
//               }, icon: const Icon(Icons.edit))),
//               Expanded(child: IconButton(onPressed: (){
//                 TodoRepo().deleteToDo(successState.todoList[index].id!);
//                 //BlocProvider.of<TodoBloc>(context).deleteToDoEvents(event, emit);
             
//               }, icon: const Icon(Icons.delete))),
    
//             ],
//           ),
//         );
//       }, 
//       separatorBuilder: (context,index) => const Divider(), 
//       itemCount: successState.todoList.length
//     );
//   }
// }

