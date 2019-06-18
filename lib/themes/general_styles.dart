
import 'package:flutter/material.dart';


inputDecoration(String label) => InputDecoration(
  labelText: label,
  enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white)
  ),
  focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
          color: Colors.green
      )
  ),
);