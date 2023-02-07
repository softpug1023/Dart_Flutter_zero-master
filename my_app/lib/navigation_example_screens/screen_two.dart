import 'package:flutter/material.dart';
import 'package:my_app/navigation_example_screens/screen_one.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/screenOne');
            },
            child: Text('Go to screen one')),
      ),
    );
  }
}
