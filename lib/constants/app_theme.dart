import 'package:guilt_app/constants/colors.dart';
import 'package:guilt_app/constants/font_family.dart';
/**
 * Creating custom color palettes is part of creating a custom app. The idea is to create
 * your class of custom colors, in this case `CompanyColors` and then create a `ThemeData`
 * object with those colors you just defined.
 *
 * Resource:
 * A good resource would be this website: http://mcg.mbitson.com/
 * You simply need to put in the Color you wish to use, and it will generate all shades
 * for you. Your primary Color will be the `500` value.
 *
 * Color Creation:
 * In order to create the custom Colors you need to create a `Map<int, Color>` object
 * which will have all the shade values. `const Color(0xFF...)` will be how you create
 * the Colors. The six character hex code is what follows. If you wanted the Color
 * #114488 or #D39090 as primary Colors in your theme, then you would have
 * `const Color(0x114488)` and `const Color(0xD39090)`, respectively.
 *
 * Usage:
 * In order to use this newly created theme or even the Colors in it, you would just
 * `import` this file in your project, anywhere you needed it.
 * `import 'path/to/theme.dart';`
 */

import 'package:flutter/material.dart';

final ThemeData themeData = new ThemeData(
    fontFamily: FontFamily.productSans,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.buttonColor, // background (button) color
        onPrimary: Colors.white, // foreground (text) color
      ),
    ),
    backgroundColor: AppColors.pageBackgroundColor,
    scaffoldBackgroundColor: AppColors.pageBackgroundColor,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        shadowColor: Colors.transparent),
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.primaryColor,
    inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        border: OutlineInputBorder(),
        floatingLabelStyle: TextStyle(color: AppColors.primaryColor),
        focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
        ),
        focusColor: AppColors.primaryColor,
        hoverColor: AppColors.primaryColor),
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch:
                MaterialColor(AppColors.mauve[900]!.value, AppColors.mauve))
        .copyWith(secondary: AppColors.cream[50]));

final ThemeData themeDataDark = ThemeData(
  fontFamily: FontFamily.productSans,
  brightness: Brightness.dark,
  primaryColor: AppColors.cream[50],
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.cream[50]),
);
