import 'package:flutter/material.dart';
import 'package:random_number_project/constant/color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingScreen> {
  double maxNumber = 10000;

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
              Expanded(
                child: Row(
                  children: maxNumber.toInt()
                      .toString()
                      .split('')
                      .map(
                        (e) => Image.asset('asset/img/$e.png',
                            width: 50.0, height: 70.0),
                      )
                      .toList(),
                ),
              ),
              Slider(
                  value: maxNumber,
                  min: 10000,
                  max: 100000,
                  onChanged: (double val) {
                    setState(() {
                      maxNumber = val;
                    });
                  }),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(maxNumber.toInt());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: RED_COLOR,
                  ),
                  child: Text('저장'))
            ],
          ),
        ),
      ),
    );
  }
}
