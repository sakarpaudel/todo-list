import 'package:flutter/material.dart';
import 'screens/todo_list_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(TodoListApp());
}

class TodoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TodoListScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
