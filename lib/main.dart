import 'package:flutter/material.dart';
import 'package:number_spinner_app/screens/number_spinner_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suma con ruletas',
      theme: ThemeData.dark(),
      home: NumberSpinnerScreen(),        
    );
  }
}
