import 'package:flutter/material.dart';
import 'ui/productform.dart';
import 'package:integration_api/models/productlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ProductList(),
        '/add-user': (context) => ProductForm(), // Rute untuk tambah pengguna
        // Tambahkan rute lain sesuai kebutuhan
      },
    );
  }
}