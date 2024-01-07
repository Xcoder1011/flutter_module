import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/router/sk_router.dart';

class MainPage extends StatefulWidget {
  final String? data;

  const MainPage({super.key, this.data});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.data ?? '默认值'),
          centerTitle: true,
        ),
        body: Center(
          child: InkWell(
            child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(30.0),
                color: Colors.yellow,
                child: const Text(
                  'open flutter page',
                  style: TextStyle(fontSize: 22.0, color: Colors.black),
                )),
            onTap: () => BoostNavigator.instance.push(SKRouter.simplePage),
          ),
        ));
  }
}
