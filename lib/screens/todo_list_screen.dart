import 'package:flutter/material.dart';
import '../widgets/todo_list.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: TodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality to add a new task
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
