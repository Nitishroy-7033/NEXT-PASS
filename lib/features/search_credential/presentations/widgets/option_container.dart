import 'package:flutter/material.dart';

class OptionContainer extends StatelessWidget {
  String label;
  OptionContainer({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 72,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        "$label",
        style: Theme.of(context).textTheme.labelSmall,
        textAlign: TextAlign.center,
      )),
    );
  }
}
