import 'package:flutter/material.dart';

class CronometroBotao extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function()? onPressedCallBack;

  const CronometroBotao({
    Key? key,
    required this.texto,
    required this.icone,
    this.onPressedCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          textStyle: const TextStyle(
            fontSize: 25,
          )),
      onPressed: onPressedCallBack,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(
            icone,
            size: 35,
          ),
        ),
        Text(texto),
      ]),
    );
  }
}
