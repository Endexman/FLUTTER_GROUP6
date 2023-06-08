// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, unused_field, prefer_const_constructors, avoid_print, unused_element

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NewUserPage(),
  ));
}

class NewUserPage extends StatefulWidget {
  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _password = '';
  String _retypePassword = '';
  bool _passwordVisible = false;

  void _createUser() {
    if (_formKey.currentState!.validate()) {
      // Perform user creation logic here
      print('User created!');
      print('First Name: $_firstName');
      print('Last Name: $_lastName');
      print('Email: $_email');
      print('Password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New User'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
                onChanged: (value) {
                  setState(() {
                    _firstName = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Last name is a required field.';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _lastName = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    child: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                obscureText: !_passwordVisible,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Retype Password',
                ),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _retypePassword = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: _createUser,
                  child: Text('Create User'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
