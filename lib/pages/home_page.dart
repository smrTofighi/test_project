import 'package:flutter/material.dart';
import 'package:test_project/pages/main_widget.dart';
import 'package:test_project/pages/main_widget2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                height: 150,
                color: Colors.green,
              ),
              Container(
                height: 150,
                color: Colors.green,
              ),
              MainWidget(),
              Container(
                height: 150,
                color: Colors.blue,
              ),
              Container(
                height: 150,
                color: Colors.blue,
              ),
              MainWidget2(),
              Container(
                height: 150,
                color: Colors.purple,
              ),
              Container(
                height: 150,
                color: Colors.purple,
              ),
              Container(
                height: 150,
                color: Colors.purple,
              ),
              Container(
                height: 150,
                color: Colors.deepOrangeAccent,
              ),
              Container(
                height: 150,
                color: Colors.redAccent,
              ),
              Container(
                height: 150,
                color: Colors.cyan,
              ),
              Container(
                height: 150,
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
