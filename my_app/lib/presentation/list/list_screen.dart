import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/presentation/list/widget/list_item.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> example = [
      'example',
      'list',
      'with',
      'strigns',
      'ddd',
      'd',
      'd',
      'd',
      'example',
      'list',
      'with',
      'strigns',
      'ddd',
      'd',
      'd',
      'd',
      'example',
      'list',
      'with',
      'strigns',
      'ddd',
      'd',
      'd',
      'd',
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text('listview'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
              itemCount: example.length,
              separatorBuilder: ((context, index) {
                return const SizedBox(
                  height: 10,
                );
              }),
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ListItem(
                  title: example[index],
                  index: index,
                );
              }),
        ));
  }
}
