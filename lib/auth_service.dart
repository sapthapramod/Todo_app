class AuthService {
  // A simple map to store users and their passwords
  final Map<String, String> _users = {}; 

  // Sign up method
  bool signUp(String username, String password) {
    if (_users.containsKey(username)) {
      return false; // User already exists
    }
    _users[username] = password; // Add user to the map
    return true; // Successful signup
  }

  // Login method
  bool login(String username, String password) {
    // Check if the username exists and the password matches
    if (_users.containsKey(username) && _users[username] == password) {
      return true; // Successful login
    }
    return false; // Invalid credentials
  }
}