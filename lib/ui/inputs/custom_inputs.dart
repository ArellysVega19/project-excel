import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.grey),
      labelStyle: TextStyle(color: Colors.grey),
      hintStyle: TextStyle(color: Colors.grey),
    );
  }

  static InputDecoration txtInputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green.withOpacity(0.3))),
      fillColor: Colors.white,
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Color(0xD9b22222))),
      isDense: true,
      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.grey),
      labelStyle: TextStyle(color: Colors.grey),
      hintStyle: TextStyle(color: Colors.grey),
    );
  }

  static InputDecoration dropwodDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green.withOpacity(0.3))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
      fillColor: Colors.white,
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      isDense: true,
      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      labelStyle: TextStyle(color: Colors.grey),
      hintStyle: TextStyle(color: Colors.grey),
    );
  }
}
