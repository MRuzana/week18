import 'package:bloc_post_sample/features/posts/ui/posts_page.dart';
import 'package:flutter/material.dart';

void main()async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Colors.blue
        )
      ),
      home: PostPage(),
    );
  }
}