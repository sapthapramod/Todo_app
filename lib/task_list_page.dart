import 'package:flutter/material.dart';
import 'database_helper.dart';

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() async {
    _tasks = await _dbHelper.getTasks();
    setState(() {});
  }

  void _addTask(String title, String description) async {
    await _dbHelper.insertTask({'title': title, 'description': description});
    _loadTasks();
  }

  void _deleteTask(int id) async {
    await _dbHelper.deleteTask(id);
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks')),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_tasks[index]['title']),
            subtitle: Text(_tasks[index]['description']),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteTask(_tasks[index]['id']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a dialog to add a task
          showDialog(
            context: context,
            builder: (context) {
              String title = '';
              String description = '';
              return AlertDialog(
                title: Text('Add Task'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                        onChanged: (value) => title = value,
                        decoration: InputDecoration(labelText: 'Title')),
                    TextField(
                        onChanged: (value) => description = value,
                        decoration: InputDecoration(labelText: 'Description')),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      _addTask(title, description);
                      Navigator.of(context).pop();
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
