import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_ui/src/color.dart';
import 'package:weather_ui/src/typography/font_weights.dart';

/// {@template weather_ui}
/// Weather text style utils.
/// {@endtemplate}
class WeatherTextStyle {
  static final TextStyle _textStyle = GoogleFonts.dmSans(
    color: WeatherColors.primaryText,
    fontWeight: WeatherFontWeight.regular,
  );

  /// Headline 1 Text Style
  static TextStyle get headline1 {
    return _textStyle.copyWith(
      fontSize: 56,
      fontWeight: WeatherFontWeight.medium,
    );
  }

  /// Headline 2 Text Style
  static TextStyle get headline2 {
    return _textStyle.copyWith(
      fontSize: 30,
      fontWeight: WeatherFontWeight.regular,
    );
  }

  /// Headline 3 Text Style
  static TextStyle get headline3 {
    return _textStyle.copyWith(
      fontSize: 24,
      fontWeight: WeatherFontWeight.regular,
    );
  }

  /// Headline 4 Text Style
  static TextStyle get headline4 {
    return _textStyle.copyWith(
      fontSize: 22,
      fontWeight: WeatherFontWeight.bold,
    );
  }

  /// Headline 5 Text Style
  static TextStyle get headline5 {
    return _textStyle.copyWith(
      fontSize: 22,
      fontWeight: WeatherFontWeight.medium,
    );
  }

  /// Headline 6 Text Style
  static TextStyle get headline6 {
    return _textStyle.copyWith(
      fontSize: 22,
      fontWeight: WeatherFontWeight.bold,
    );
  }

  /// Subtitle 1 Text Style
  static TextStyle get subtitle1 {
    return _textStyle.copyWith(
      fontSize: 16,
      fontWeight: WeatherFontWeight.bold,
    );
  }

  /// Subtitle 2 Text Style
  static TextStyle get subtitle2 {
    return _textStyle.copyWith(
      fontSize: 14,
      fontWeight: WeatherFontWeight.bold,
    );
  }

  /// Body Text 1 Text Style
  static TextStyle get bodyText1 {
    return _textStyle.copyWith(
      fontSize: 18,
      fontWeight: WeatherFontWeight.medium,
    );
  }

  /// Body Text 2 Text Style (the default)
  static TextStyle get bodyText2 {
    return _textStyle.copyWith(
      fontSize: 16,
      fontWeight: WeatherFontWeight.regular,
    );
  }

  /// Caption Text Style
  static TextStyle get caption {
    return _textStyle.copyWith(
      fontSize: 14,
      fontWeight: WeatherFontWeight.regular,
    );
  }

  /// Overline Text Style
  static TextStyle get overline {
    return _textStyle.copyWith(
      fontSize: 16,
      fontWeight: WeatherFontWeight.regular,
    );
  }

  /// Button Text Style
  static TextStyle get button {
    return _textStyle.copyWith(
      fontSize: 18,
      fontWeight: WeatherFontWeight.medium,
    );
  }

  /// Text Button Text Style
  static TextStyle get textButton {
    return _textStyle.copyWith(
      fontSize: 16,
      fontWeight: WeatherFontWeight.medium,
    );
  }

  ///Big Text
  static TextStyle get bigText => _textStyle.copyWith(
        fontSize: 27,
        fontWeight: WeatherFontWeight.maxBold,
      );

  ///Small Text
  static TextStyle get smallText => _textStyle.copyWith(
        fontSize: 12,
        fontWeight: WeatherFontWeight.regular,
      );
}
