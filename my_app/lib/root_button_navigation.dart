import 'package:flutter/material.dart';
import 'package:my_app/presentation/counter/counter_screen.dart';
import 'package:my_app/presentation/list/list_screen.dart';
import 'package:my_app/presentation/theme_animation/theme_animation_screen.dart';
import 'package:my_app/presentation/widget_examples/home_screen.dart';

class RootButtonNavigation extends StatefulWidget {
  const RootButtonNavigation({super.key});

  @override
  State<RootButtonNavigation> createState() => _RootButtonNavigationState();
}

class _RootButtonNavigationState extends State<RootButtonNavigation> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(),
          CounterScreen(),
          ListScreen(),
          ThemeAnimationScreen(),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Example'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'counter'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'list'),
          BottomNavigationBarItem(icon: Icon(Icons.color_lens), label: 'theme')
        ],
      ),
    );
  }
}
