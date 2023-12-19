import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(String username, String password) async {
    final apiUrl = 'https://dev.uinsgd.site/api/index.php/mhs/login';
    final response = await http.post(Uri.parse(apiUrl), body: {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      final token = json.decode(response.body)['token'];
      final user = json.decode(response.body)['user'];
      final akm = json.decode(response.body)['akm'];

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            id: user['id'],
            name: user['name'],
            foto: user['foto'],
            email: user['email'],
            token: token,
            jurusan: user['jurusan'],
            fakultas: user['fakultas'],
            angkatan: user['angkatan'],
            nilai: akm
          ),
        ),
            (route) => false,
      );
    } else {
      // Handle login failure
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login SALAM'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              width: 300,
              image: NetworkImage('https://salam.uinsgd.ac.id/dashboard/assets/logo_salam.png'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                // Loader logic and delay here...
                login(emailController.text, passwordController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
