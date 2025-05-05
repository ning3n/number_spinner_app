import 'package:flutter/material.dart';
import 'package:number_spinner_app/components/number_wheel.dart';

class NumberSpinnerScreen extends StatefulWidget {
  const NumberSpinnerScreen({super.key});

  @override
  State<NumberSpinnerScreen> createState() => _NumberSpinnerScreenState();
}

class _NumberSpinnerScreenState extends State<NumberSpinnerScreen> {
  int selectedNumber1 = 0;
  int selectedNumber2 = 0;

  final List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sumador de Ruleta')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Selecciona dos numeros:', style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numberWheel(
                onSelectedItemChanged: (index){
                  setState(() => selectedNumber1 = numbers[index]);
                },
              ),
              numberWheel(
                onSelectedItemChanged: (index){
                  setState(() => selectedNumber2 = numbers[index]);
                },
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            'Resultado: ${selectedNumber1 + selectedNumber2}',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.cyanAccent),
          )
        ],
      ),
    );
  }
}