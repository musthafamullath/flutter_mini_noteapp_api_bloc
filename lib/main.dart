import 'package:flutter/material.dart';
import 'package:note_app_api_bloc/features/home/home_page.dart';
import 'package:note_app_api_bloc/features/posts/ui/posts_page.dart';
void main(List<String> args)async {
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Note APP",
      debugShowCheckedModeBanner: false,
      home:const PostPage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(backgroundColor: Colors.grey),
        useMaterial3: true,
      ),
    );
  }
}