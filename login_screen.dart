import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DashboardScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
          centerTitle: true,
          title: Text('Login', style: TextStyle(color: Colors.white))
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 26),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                  isDense: true,
                ),
                validator: (value) =>
                value!.isEmpty ? 'Enter your email' : null,
              ),
              SizedBox(height: 16),

              // Password
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  contentPadding: EdgeInsets.all(12),
                ),
                validator: (value) =>
                value!.isEmpty ? 'Enter your password' : null,
              ),
              SizedBox(height: 20),

              // Button
              ElevatedButton(
                onPressed: _login,
                child: Text('Login', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
