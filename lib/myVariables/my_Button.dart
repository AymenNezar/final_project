import 'package:flutter/material.dart';
import 'colors.dart';

final ButtonStyle myButton = ElevatedButton.styleFrom(
          backgroundColor: mainColor,
          foregroundColor: Colors.white, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Border radius
          ),
        ).copyWith(
  backgroundColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return darkColor; // Color when pressed
      }
      return mainColor; // Default color
    },
  ),
);

