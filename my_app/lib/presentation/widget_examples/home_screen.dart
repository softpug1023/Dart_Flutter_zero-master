import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/application/theme_service.dart';
import 'package:my_app/navigation_example_screens/screen_two.dart';
import 'package:my_app/presentation/components/custom_button.dart';
import 'package:my_app/presentation/widget_examples/widgets/button_examples.dart';
import 'package:my_app/presentation/widget_examples/widgets/flexible_example.dart';
import 'package:my_app/presentation/widget_examples/widgets/hello_text_example.dart';
import 'package:my_app/presentation/widget_examples/widgets/home_text.dart';
import 'package:my_app/presentation/widget_examples/widgets/layout_build_example.dart';
import 'package:my_app/presentation/widget_examples/widgets/person.dart';
import 'package:my_app/presentation/widget_examples/widgets/stack_example.dart';
import 'package:provider/provider.dart';

import '../../navigation_example_screens/screen_one.dart';

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
            Person(
                name: 'name',
                age: 'age',
                country: 'country',
                job: 'job',
                pictureURL:
                    'https://tse2-mm.cn.bing.net/th/id/OIP-C.5or_Q_ual-arU2WZUjYPagHaE8?w=264&h=180&c=7&r=0&o=5&dpr=2&pid=1.7'),
            SizedBox(
              height: 20,
            ),
            HelloText(),
            SizedBox(
              height: 20,
            ),
            LayoutBuilderExample(),
            ButtonExamples(),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/screenOne');
                },
                child: const Text('screen1')),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/screenTwo');
                },
                child: const Text('screen2')),
            FloatingActionButton(onPressed: () {
              Provider.of<ThemeService>(context, listen: false).toggleTheme();
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
      ),
    );
  }
}
