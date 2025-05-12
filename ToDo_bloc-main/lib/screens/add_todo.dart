import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/bloc/bloc/todo_bloc.dart';
import 'package:to_do_app/model/todo_model.dart';
import 'package:to_do_app/repos/todo_repo.dart';

class AddTodoScreen extends StatelessWidget {
  final TodoModel? todoList;
  AddTodoScreen({super.key, this.todoList});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;
  final TodoBloc todoBloc = TodoBloc();

  @override
  Widget build(BuildContext context) {

    if( todoList!=null){
      isEdit = true;
      titleController.text = todoList!.title;
      descriptionController.text = todoList!.description;
    }
    return Scaffold(
      appBar: AppBar(
        
        title: isEdit
            ? const Text('Edit Todo')
            : const Text('Add ToDo'),
      ),
      body: BlocBuilder(  

        bloc: todoBloc,
        builder: ((context, state) {
          return SafeArea(
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
        ));
        }),
        
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
      //Api(todoModel: todo,context: context).updateData();
      TodoRepo(todoModel: todo, context: context).updateData();
    } else {
      todo = TodoModel(title: title, description: description);
      TodoRepo(todoModel: todo, context: context).addToDo();
    }
  }
}

// class AddTodoScreen extends StatefulWidget {

//   final TodoModel? todoList;
//   const AddTodoScreen({super.key,this.todoList});
  

//   @override
//   State<AddTodoScreen> createState() => _AddTodoScreenState();
// }

// class _AddTodoScreenState extends State<AddTodoScreen> {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   bool isEdit = false;

//   @override
//   void initState() {
    
//     super.initState();
   
//     if(widget.todoList != null){
//         isEdit = true;
//         titleController.text = widget.todoList!.title;  
//         descriptionController.text = widget.todoList!.description;   
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         //title: const Text('Add Todo'),
//         title: isEdit? const Text('Edit Todo') : const Text('Add ToDo'),
//       ),
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             TextField(
//               controller: titleController,
//               keyboardType: TextInputType.text,
//               decoration: const InputDecoration(
//                   hintText: 'Title',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(
//                     Radius.circular(20),
//                   ))),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             TextField(
//               controller: descriptionController,
//               minLines: 5,
//               maxLines: 8,
//               keyboardType: TextInputType.multiline,
//               decoration: const InputDecoration(
//                   hintText: 'Description',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(
//                     Radius.circular(20),
//                   ))),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 ElevatedButton(
//                     style: const ButtonStyle(
//                         backgroundColor: MaterialStatePropertyAll(Colors.blue)),
//                     onPressed: () {
//                       submitForm(context);
//                     },
//                     child: isEdit?
//                       const Text('UPDATE',
//                       style: TextStyle(color: Colors.black),
//                     ):
//                      const Text('SUBMIT',
//                       style: TextStyle(color: Colors.black),
//                     )),
//               ],
//             )
//           ],
//         ),
//       )),
//     );
//   }

//   Future<void> submitForm(BuildContext context) async {

//     final TodoModel todo;
//     final title = titleController.text.trim();
//     final description = descriptionController.text.trim();
    
   
//     if(isEdit){
//       final id = widget.todoList!.id;
//       todo=TodoModel(title: title, description: description,id: id);
//       Api(todoModel: todo,context: context).updateData();
//     }
//     else{
//       todo = TodoModel(title: title, description: description);
//       Api(todoModel: todo, context: context).submitAddData();
//     }
//   }
// }
