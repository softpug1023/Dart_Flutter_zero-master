import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('counter')),
      body: Center(
        child: Text(
          _counter.toString(),
          style: TextStyle(fontSize: 60, color: Colors.red),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: 'btn1',
              onPressed: () => {
                setState((() {
                  _counter -= 1;
                }))
              },
              backgroundColor: Colors.amber,
              child: Icon(Icons.remove),
            ),
            FloatingActionButton(
              heroTag: 'btn2',
              onPressed: () => {
                setState((() {
                  _counter += 1;
                }))
              },
              backgroundColor: Colors.amber,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
