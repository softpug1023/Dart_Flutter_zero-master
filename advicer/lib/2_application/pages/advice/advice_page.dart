import 'package:advicer/2_application/core/services/theme_service.dart';
import 'package:advicer/2_application/pages/advice/cubit/advicer_cubit.dart';
import 'package:advicer/2_application/pages/advice/widgets/advice_field.dart';
import 'package:advicer/2_application/pages/advice/widgets/custom_button.dart';
import 'package:advicer/2_application/pages/advice/widgets/error_message.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AdvicePageWrapperProvider extends StatelessWidget {
  const AdvicePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvicerCubit(),
      child: AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'advisor',
          style: themeData.textTheme.bodyLarge,
        ),
        centerTitle: true,
        actions: [
          Switch(
              value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Center(child: BlocBuilder<AdvicerCubit, AdvicerCubitState>(
                  builder: (context, state) {
                if (state is AdvicerInitial) {
                  return Text(
                    'Your advice is waiting for you',
                    style: themeData.textTheme.bodyMedium,
                  );
                } else if (state is AdvicerStateLoading) {
                  return CircularProgressIndicator(
                    color: themeData.colorScheme.secondary,
                  );
                } else if (state is AdvicerStateLoaded) {
                  return Center(
                      child: AdviceField(
                    advice: state.advice,
                  ));
                } else if (state is AdvicerStateError) {
                  return ErrorMessage(message: state.message);
                }
                return Placeholder();
              })),
            ),
            const SizedBox(height: 100, child: Center(child: CustomButton())),
          ],
        ),
      ),
    );
  }
}
