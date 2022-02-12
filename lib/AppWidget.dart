import 'package:flutter/material.dart';
import 'package:pomodoro_clock/pages/Pomodoro.dart';
import 'package:pomodoro_clock/stores/pomodoro.store.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: (_) => PomodoroStore(),
        ),
      ],
      child: const MaterialApp(
        home: Pomodoro(),
      ),
    );
  }
}
