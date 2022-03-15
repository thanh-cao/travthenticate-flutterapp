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

AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: colorScheme.surface,
    iconTheme: IconThemeData(
      color: colorScheme.primary,
    ));

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    overlayColor: getColor(
      colorScheme.primary,
      colorScheme.secondary,
    ),
  ),
);

OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    overlayColor: getColor(
      colorScheme.primary,
      colorScheme.secondary,
    ),
    side: getBorder(
      colorScheme.primary,
      colorScheme.secondary,
    ),
  ),
);

TextTheme textTheme = TextTheme(
  headlineLarge: TextStyle(color: colorScheme.primary),
  headlineMedium: TextStyle(color: colorScheme.primary),
  headlineSmall: TextStyle(color: colorScheme.primary),
  titleLarge: TextStyle(color: colorScheme.primary),
  titleMedium: TextStyle(color: colorScheme.primary),
  titleSmall: TextStyle(color: colorScheme.primary),
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
