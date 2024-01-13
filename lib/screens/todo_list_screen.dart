import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  int _currentIndex = 0; // Added for bottom navigation

  List<String> tasks = [];
  final TextEditingController _taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      tasks = prefs.getStringList('tasks') ?? [];
    });
  }

  Future<void> _saveTasks(List<String> tasksList) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('tasks', tasksList);
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add a New Task'),
          content: TextField(
            controller: _taskController,
            decoration: InputDecoration(labelText: 'Task'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.add(_taskController.text);
                });
                _taskController.clear();
                _saveTasks(tasks);
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _deleteTask(int index) {
    if (index >= 0 && index < tasks.length) {
      setState(() {
        tasks.removeAt(index);
      });
      _saveTasks(tasks);
    }
  }

  void _navigateToSettingsScreen() {
    Navigator.pushNamed(context, '/settings');
  }

  // Added for bottom navigation
  void _onItemTapped(int index) {
    if (index == 1) {
      _navigateToSettingsScreen();
    }
    // Handle other items if needed
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: TodoList(tasks: tasks, onDelete: _deleteTask),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
      // Added bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'ToDo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  final List<String> tasks;
  final Function(int) onDelete;

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
              widget.onDelete(index);
            },
          ),
        );
      },
    );
  }
}
