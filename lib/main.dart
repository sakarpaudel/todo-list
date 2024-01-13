import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/themes/theme_provider.dart';
import 'screens/todo_list_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create:(context)=> ThemeProvider(),
      child: TodoListApp(),
    ),
  );
}

class TodoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      theme: Provider.of<ThemeProvider>(context).themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => TodoListScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
