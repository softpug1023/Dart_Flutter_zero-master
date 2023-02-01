import 'package:flutter/material.dart';

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 300,
      width: 300,
      child: LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: Container(
            color: Colors.blue,
            width: constraints.maxWidth / 2,
            height: constraints.maxHeight / 2,
            child: const Center(
              child: Text('Layout builder'),
            ),
          ),
        );
      }),
    );
  }
}
