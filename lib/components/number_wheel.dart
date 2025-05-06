import 'package:flutter/material.dart';

Widget numberWheel({required Function(int) onSelectedItemChanged}){
  final List<int> numbers = List.generate(100, (index) => index);
  return SizedBox(
    height: 150,
    width: 100,
    child: ListWheelScrollView.useDelegate(
      itemExtent: 40,
      perspective: 0.005,
      diameterRatio: 1.2,
      onSelectedItemChanged: onSelectedItemChanged,
      physics: FixedExtentScrollPhysics(), 
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (context, index) => Center(
          child: Text(
            numbers[index].toString(),
            style: TextStyle(fontSize: 40),
          ),
        ),
        childCount: numbers.length,
        ),
      ),
  );
}