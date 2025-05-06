import 'package:flutter/material.dart';

Widget numberWheel({required FixedExtentScrollController controller, required Function(int) onSelectedItemChanged}){
  final List<int> numbers = List.generate(100, (index) => index);
  return SizedBox(
    height: 150,
    width: 100,
    child: ListWheelScrollView.useDelegate(
      controller: controller,
      itemExtent: 40,
      perspective: 0.005,
      diameterRatio: 1.2,
      onSelectedItemChanged: onSelectedItemChanged,
      physics: FixedExtentScrollPhysics(), 
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (context, index) => Center(
          child: Text(
            numbers[index].toString(),
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        childCount: numbers.length,
        ),
      ),
  );
}