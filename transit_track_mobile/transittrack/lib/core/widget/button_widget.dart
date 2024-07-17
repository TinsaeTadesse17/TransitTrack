import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final BuildContext context;
  final String text;
  final VoidCallback onClick;
  const ButtonWidget({
    super.key,
    required this.context,
    required this.text,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 43,
        width: 128,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(100))),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
