import 'package:flutter/material.dart';
import 'signup_page.dart'; // Import the signup page
import 'login_page.dart'; // Import the login page if needed
import 'task_list_page.dart'; // Import the task list page if needed

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SignUpPage(), // Set SignUpPage as the home page
    );
  }
}