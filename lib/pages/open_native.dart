import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class SimplePage extends StatelessWidget {
  const SimplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(30.0),
            color: Colors.green,
            child: const Text(
              'open native page',
              style: TextStyle(fontSize: 22.0, color: Colors.black),
            )),
        onTap: () => BoostNavigator.instance.push("myApp://home/message"),
      )),
    );
  }
}
