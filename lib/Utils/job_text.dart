import 'package:flutter/material.dart';

Widget jobText(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, bottom: 5),
    child: Text(
      text,
      style: const TextStyle(color: Color.fromARGB(255, 116, 116, 116)),
    ),
  );
}
