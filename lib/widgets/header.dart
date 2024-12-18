import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Inventory Management",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
