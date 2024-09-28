import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'login_page.dart'; // Import the login page

class SignUpPage extends StatelessWidget {
  final AuthService _authService = AuthService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signUp(BuildContext context) {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (_authService.signUp(username, password)) {
    print('User signed up: $username');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
} else {
    print('Signup failed: User already exists');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User already exists')));
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _usernameController, decoration: InputDecoration(labelText: 'Username')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _signUp(context),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}