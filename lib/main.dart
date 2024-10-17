import 'package:flutter/material.dart';
import 'package:profil_diri/Page1.dart';
import 'page2.dart'; // Mengimpor file page2

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/page1': (context) => Page1(
            username: '',
            role: '',
            school: '',
            description: ''), // Tempatkan nilai default
        '/page2': (context) => Page2(), // Route untuk Page2
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _role = '';
  String _school = '';
  String _description = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Arahkan ke halaman page1 setelah data berhasil diisi
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Page1(
            username: _name, // Menggunakan nama sebagai username
            role: _role,
            school: _school,
            description: _description,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Login form
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome!',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Input Nama
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          prefixIcon: Icon(Icons.person, color: Colors.black),
                          labelStyle: TextStyle(fontSize: 18),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _name = value!;
                        },
                      ),
                      SizedBox(height: 20),
                      // Input Role
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Role',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          prefixIcon: Icon(Icons.business, color: Colors.black),
                          labelStyle: TextStyle(fontSize: 18),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your role';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _role = value!;
                        },
                      ),
                      SizedBox(height: 20),
                      // Input Sekolah
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'School',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          prefixIcon: Icon(Icons.school, color: Colors.black),
                          labelStyle: TextStyle(fontSize: 18),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your school';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _school = value!;
                        },
                      ),
                      SizedBox(height: 20),
                      // Input Deskripsi
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Deskripsi',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          prefixIcon:
                              Icon(Icons.description, color: Colors.black),
                          labelStyle: TextStyle(fontSize: 18),
                        ),
                        maxLines: 3, // Memungkinkan multi-line input
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _description = value!;
                        },
                      ),
                      SizedBox(height: 30),
                      // Tombol Submit
                      ElevatedButton(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          primary: Colors.blue[700],
                          onPrimary: Colors.white,
                          textStyle: TextStyle(fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
