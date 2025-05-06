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
  final FixedExtentScrollController controller1 = FixedExtentScrollController();
  final FixedExtentScrollController controller2 = FixedExtentScrollController();

  void resetear() {
    controller1.jumpToItem(0);
    controller2.jumpToItem(0);
    setState(() {
      selectedNumber1 = 0;
      selectedNumber2 = 0;
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sumador de Ruleta', style: TextStyle(fontWeight: FontWeight.bold)), backgroundColor: Colors.pinkAccent, foregroundColor: Colors.white),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Selecciona 2 numeros', style: TextStyle(fontSize: 30, color: Colors.cyan, fontWeight: FontWeight.bold),),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numberWheel(
                controller: controller1,
                onSelectedItemChanged: (index){
                  setState(() => selectedNumber1 = numbers[index]);
                },
              ),
              numberWheel(
                controller: controller2,
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100, 
              width: 100, 
              child: ElevatedButton(
                onPressed: resetear,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  foregroundColor: Colors.white,
                ),
                child: Text('RESET', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,))
              )
            ),
          )
        ],
      ),
    );
  }
}