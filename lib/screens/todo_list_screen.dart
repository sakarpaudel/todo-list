import 'package:flutter/material.dart';
import '../widgets/todo_list.dart';
import '/screens/settings_screen.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    TodoList(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'To-Do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality to add a new task
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      // Navigate to the Settings screen when the "Settings" tab is tapped
      Navigator.pushNamed(context, '/settings');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}
