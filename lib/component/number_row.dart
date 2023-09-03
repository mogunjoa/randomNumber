import 'package:flutter/material.dart';

class NumberRow extends StatelessWidget {
  final int number;

  const NumberRow({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
          .toString()
          .split('')
          .map(
            (y) => Image.asset(
              'asset/img/$y.png',
              height: 70,
              width: 50,
            ),
          )
          .toList(),
    );
  }
}
