import 'package:flutter/material.dart';

const ColorScheme colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color.fromARGB(255, 34, 192, 195),
  onPrimary: Color.fromARGB(255, 255, 255, 255),
  secondary: Color.fromARGB(255, 253, 187, 45),
  onSecondary: Color.fromARGB(255, 255, 255, 255),
  error: Colors.red,
  onError: Color.fromARGB(255, 255, 255, 255),
  background: Color.fromARGB(255, 255, 255, 255),
  onBackground: Color.fromARGB(255, 0, 0, 0),
  surface: Color.fromARGB(255, 255, 255, 255),
  onSurface: Color.fromARGB(255, 0, 0, 0),
);

const AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: Color.fromARGB(255, 255, 255, 255),
);

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    overlayColor: getColor(
      const Color.fromARGB(255, 34, 192, 195),
      const Color.fromARGB(255, 253, 187, 45),
    ),
  ),
);

OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    overlayColor: getColor(
      const Color.fromARGB(255, 34, 192, 195),
      const Color.fromARGB(255, 253, 187, 45),
    ),
    side: getBorder(
      const Color.fromARGB(255, 34, 192, 195),
      const Color.fromARGB(255, 253, 187, 45),
    ),
  ),
);

// function to get MaterialStateProperty color or border based on button's state
MaterialStateProperty<Color> getColor(
  Color initialColor,
  Color pressedColor,
) {
  return MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered) ||
          states.contains(MaterialState.focused) ||
          states.contains(MaterialState.pressed)) {
        return pressedColor;
      }
      return initialColor;
    },
  );
}

MaterialStateProperty<BorderSide> getBorder(
  Color initialColor,
  Color pressedColor,
) {
  return MaterialStateProperty.resolveWith<BorderSide>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered) ||
          states.contains(MaterialState.focused) ||
          states.contains(MaterialState.pressed)) {
        return BorderSide(
          color: pressedColor,
          width: 1.0,
          style: BorderStyle.solid,
        );
      }
      return BorderSide(
        color: initialColor,
        width: 1.0,
        style: BorderStyle.solid,
      );
    },
  );
}
