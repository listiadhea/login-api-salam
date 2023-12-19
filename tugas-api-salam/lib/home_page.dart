import 'package:flutter/material.dart';
import 'login_screen.dart';

class HomePage extends StatefulWidget {
  final int id;
  final String name;
  final String foto;
  final String email;
  final String token;
  final String jurusan;
  final String fakultas;
  final String angkatan;
  final List<dynamic> nilai;

  HomePage({
    required this.id,
    required this.name,
    required this.foto,
    required this.email,
    required this.token,
    required this.jurusan,
    required this.fakultas,
    required this.angkatan,
    required this.nilai
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> handleLogout(String token) async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () => handleLogout(widget.token),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              width: 100,
              image: NetworkImage('${widget.foto}'),
            ),
            SizedBox(height: 16.0),
            Text('Welcome, ${widget.name}!'),
            SizedBox(height: 16.0),
            Text('Email: ${widget.email}'),
            SizedBox(height: 16.0),
            Text('Name: ${widget.name}'),
            SizedBox(height: 16.0),
            Text('Jurusan: ${widget.jurusan}'),
            SizedBox(height: 16.0),
            Text('Fakultas: ${widget.fakultas}'),
            SizedBox(height: 16.0),
            Text('Angkatan: ${widget.angkatan}'),
            SizedBox(height: 16.0),
            for (int index = 0; index < widget.nilai.length-1; index++)
              Text('IP Semester ${index+1}: ${widget.nilai[index]['ip']}'),
              SizedBox(height: 16.0),
            Text('IPK: ${widget.nilai.last['ipk']}'),
          ],
        ),
      ),
    );
  }
}
