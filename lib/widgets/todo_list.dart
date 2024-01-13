import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  final List<String> tasks;
  final Function(int, List<String>) onDelete;

  TodoList({required this.tasks, required this.onDelete});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(widget.tasks[index]),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                // Call the onDelete callback when the delete button is pressed
                widget.onDelete(index, widget.tasks);
              });
            },
          ),
        );
      },
    );
  }
}
