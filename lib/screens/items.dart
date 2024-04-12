import 'package:flutter/material.dart';

Text buildText({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

Padding buildTextForm({
  required TextEditingController controller,
  required String text,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 20,
    ),
    child: TextFormField(
      controller: controller,
      enabled: false,
      decoration: InputDecoration(
          labelText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          )),
    ),
  );
}
