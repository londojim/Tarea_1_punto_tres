import 'package:flutter/material.dart';
import 'package:punto3/pages/notafinal_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cálculo de Nota Final',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(
          secondary: Colors.deepOrange,
        ),

      ),
      home: const NotaFinalPage(),
    );
  }
}
