import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:salihflutter/registrationPage.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage1(),
  ));
}

class LoginPage1 extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String username = "";
  String password = '';
  // Validator for email field
  // final emailValidator = Validator(
  //   rules: <StringFunction>[
  //     ValidationRuleEmail('Invalid email address'),
  //   ],
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                //  validator: emailValidator,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    //String userip = uname_controller.text;
                    if (username == _emailController.text &&
                        password == _passwordController.text) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Invalid username/ Password or the Fields are empty'),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  child: const Text("Login")),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => registrationPage()));
                  // Form is valid, perform login here
                  // You can access the email and password via _emailController.text and _passwordController.text
                },
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
