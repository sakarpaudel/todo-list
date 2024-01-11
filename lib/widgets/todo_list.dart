import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Task 1'),
        ),
        ListTile(
          title: Text('Task 2'),
        ),
        // Add more ListTiles for additional tasks
      ],
    );
  }
}
