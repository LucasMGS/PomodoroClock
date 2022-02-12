import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_clock/components/Cronometro.dart';
import 'package:pomodoro_clock/components/EntradaTempo.dart';
import 'package:pomodoro_clock/stores/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Cronometro(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EntradaTempo(
                    titulo: 'Trabalho',
                    valor: store.tempoTrabalho,
                    incrementarCallBack:
                        store.iniciado && store.estaTrabalhando()
                            ? null
                            : store.incrementarTempoTrabalho,
                    decrementarCallBack:
                        store.iniciado && store.estaTrabalhando()
                            ? null
                            : store.decrementarTempoTrabalho,
                  ),
                  EntradaTempo(
                    titulo: 'Descanso',
                    valor: store.tempoDescanso,
                    incrementarCallBack:
                        store.iniciado && store.estaDescansando()
                            ? null
                            : store.incrementarTempoDescanso,
                    decrementarCallBack:
                        store.iniciado && store.estaDescansando()
                            ? null
                            : store.decrementarTempoDescanso,
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
