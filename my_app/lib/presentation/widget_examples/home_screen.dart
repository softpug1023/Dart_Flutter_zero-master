import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/presentation/widget_examples/widgets/button_examples.dart';
import 'package:my_app/presentation/widget_examples/widgets/flexible_example.dart';
import 'package:my_app/presentation/widget_examples/widgets/hello_text_example.dart';
import 'package:my_app/presentation/widget_examples/widgets/home_text.dart';
import 'package:my_app/presentation/widget_examples/widgets/layout_build_example.dart';
import 'package:my_app/presentation/widget_examples/widgets/stack_example.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cupertino app'),
      ),
      backgroundColor: Color.fromARGB(255, 252, 209, 82),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            HomeText(),
            SizedBox(
              height: 20,
            ),
            StackExample(),
            SizedBox(
              height: 20,
            ),
            FlexibleExample(),
            SizedBox(
              height: 20,
            ),
            HelloText(),
            SizedBox(
              height: 20,
            ),
            LayoutBuilderExample(),
            ButtonExamples(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
      ),
    );
  }
}
