import 'package:flutter/material.dart';

class VegIndicatior extends StatelessWidget {
  final bool isVegetarian;
  const VegIndicatior({Key? key, this.isVegetarian = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        height: 22,
        width: 22,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: isVegetarian ? Colors.green : Colors.red,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.2),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isVegetarian ? Colors.green : Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
