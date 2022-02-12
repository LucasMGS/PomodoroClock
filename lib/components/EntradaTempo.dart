import 'package:flutter/material.dart';
import 'package:pomodoro_clock/stores/pomodoro.store.dart';
import 'package:provider/provider.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;
  final void Function()? incrementarCallBack;
  final void Function()? decrementarCallBack;
  const EntradaTempo({
    Key? key,
    required this.titulo,
    required this.valor,
    this.incrementarCallBack,
    this.decrementarCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          titulo,
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
                primary: store.estaTrabalhando() ? Colors.red : Colors.green,
              ),
              onPressed: decrementarCallBack,
            ),
            Text(
              '$valor min',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
                primary: store.estaTrabalhando() ? Colors.red : Colors.green,
              ),
              onPressed: incrementarCallBack,
            ),
          ],
        ),
      ],
    );
  }
}
