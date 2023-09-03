import 'package:flutter/material.dart';
import 'package:random_number_project/component/number_row.dart';
import 'package:random_number_project/constant/color.dart';

class SettingScreen extends StatefulWidget {
  final int maxNumber;
  const SettingScreen({required this.maxNumber});

  @override
  State<SettingScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingScreen> {
  double maxNumber = 1000;

  @override
  void initState() {
    super.initState();

    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Body(maxNumber: maxNumber),
              _Footer(
                maxNumber: maxNumber,
                changedFunction: onChangedFunction,
                onPressedFunction: onPressedFunction,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onChangedFunction(double val) {
    setState(() {
      maxNumber = val;
    });
  }

  void onPressedFunction() {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;

  const _Body({required this.maxNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(number: maxNumber.toInt()),
    );
  }
}

class _Footer extends StatelessWidget {
  final ValueChanged<double> changedFunction;
  final VoidCallback onPressedFunction;
  final double maxNumber;

  const _Footer(
      {required this.maxNumber,
      required this.changedFunction,
      required this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
            value: maxNumber,
            min: 1000,
            max: 100000,
            onChanged: changedFunction),
        ElevatedButton(
            onPressed: onPressedFunction,
            style: ElevatedButton.styleFrom(
              primary: RED_COLOR,
            ),
            child: Text('저장')),
      ],
    );
  }
}
