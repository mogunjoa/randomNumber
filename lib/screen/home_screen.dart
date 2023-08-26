import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_project/constant/color.dart';
import 'package:random_number_project/screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [123, 456, 789];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(),
              _Body(randomNumbers: randomNumbers),
              _Footer(onPressedFunction: onPressedFunction)
            ],
          ),
        ),
      ),
    );
  }

  void onPressedFunction() {
    final rand = Random();
    final Set<int> newNumbers = {};

    while(newNumbers.length != 3) {
      final number = rand.nextInt(1000);
      newNumbers.add(number);
      print(newNumbers);
    }
    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.w700),
        ),
        IconButton(
            onPressed: () {
              final result = Navigator.of(context).push<int>(
                MaterialPageRoute(builder: (BuildContext context){
                  return SettingScreen();
                }
                )
              );
              print(result);
            },
            icon: Icon(
              Icons.settings,
              color: RED_COLOR,
            ))
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumbers;
  const _Body({required this.randomNumbers, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: randomNumbers
              .asMap()
              .entries
              .map((x) => Padding(
            padding: EdgeInsets.only(
                bottom: x.key == 2 ? 0 : 16.0),
            child: Row(
              children: x.value
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
            ),
          ))
              .toList()),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressedFunction;
  const _Footer({required this.onPressedFunction, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: RED_COLOR),
            onPressed: onPressedFunction,
            child: Text('생성하기')));
  }
}


