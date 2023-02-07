import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Person extends StatelessWidget {
  final String pictureURL;
  final String name;
  final String age;
  final String country;
  final String job;

  const Person({
    super.key,
    required this.name,
    required this.age,
    required this.country,
    required this.job,
    required this.pictureURL,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(16)),
      child: Column(children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(pictureURL),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white54),
              child: Center(
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            )
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Text('age'),
                Spacer(),
                Text(
                  age,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
