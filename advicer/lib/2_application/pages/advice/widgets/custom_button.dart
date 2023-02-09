import 'package:advicer/2_application/pages/advice/cubit/advicer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkResponse(
        onTap: () => onTap?.call(),
        child: Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(15),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: onTap == null
                      ? themeData.colorScheme.tertiary
                      : themeData.colorScheme.secondary),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: Text(
                  'get advice',
                  style: themeData.textTheme.bodyMedium?.copyWith(
                      color: onTap == null ? Colors.grey : Colors.blueAccent),
                ),
              )),
        ));
  }
}
