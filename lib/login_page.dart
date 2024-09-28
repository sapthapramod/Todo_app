import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'task_list_page.dart'; // Import the task list page

class LoginPage extends StatelessWidget {
  final AuthService _authService = AuthService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (_authService.login(username, password)) {
      // Navigate to the task list if login is successful
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TaskListPage()),
      );
      print("attempting to login with: $username, $password");
    } else {
      // Show error message if login fails
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Invalid credentials')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username')),
            TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context), // Call the login method
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
