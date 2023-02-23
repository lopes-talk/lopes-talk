import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Path extends StatelessWidget {
  const Path({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfffC4DFCB),
      child: Center(
          child: Text(
        'Page Number 1',
        style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500),
      )),
    );
  }
}
