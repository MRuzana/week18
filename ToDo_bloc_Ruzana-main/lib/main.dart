import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/bloc/bloc/todo_bloc.dart';
import 'package:to_do_app/repos/todo_repo.dart';
import 'package:to_do_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TodoRepo(),
      child: BlocProvider(
        create: (context) => TodoBloc(context.read<TodoRepo>())..add(TodoInitialFetechingEvents()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Colors.blue,
              appBarTheme: const AppBarTheme(color: Colors.blue)),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
