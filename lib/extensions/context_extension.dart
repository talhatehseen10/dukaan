import 'package:flutter/material.dart';
import 'package:dukaan/constants/constants.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get _mediaQuery => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);

  double get deviceWidth => _mediaQuery.size.width;
  double get deviceHeight => _mediaQuery.size.height;
  bool get isLandscape => _mediaQuery.orientation == Orientation.landscape;
  bool get isPortrait => _mediaQuery.orientation == Orientation.portrait;

  bool get isAndroid => theme.platform == TargetPlatform.android;
  bool get isIOS => theme.platform == TargetPlatform.iOS;

  // Context Colors
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;
  Color get backgroundColor => theme.colorScheme.background;
  Color get canvasColor => theme.canvasColor;
  Color get cardColor => theme.cardColor;
  Color get primaryColor => theme.primaryColor;
  Color get primaryColorDark => theme.primaryColorDark;
  Color get errorColor => theme.colorScheme.error;
  Color get dividerColor => theme.dividerColor;
  Color get disabledColor => theme.primaryColorDark;
  Color get hoverColor => theme.hoverColor;
  Color get dialogBackgroundColor => theme.cardColor;
  Color get textBoxColor => theme.cardColor;

  // Material 3 Colors
  Color get background => theme.colorScheme.background;
  Color get onBackground => theme.colorScheme.onBackground;
  Color get secondary => theme.colorScheme.secondary;
  Color get onSecondary => theme.colorScheme.onSecondary;
  Color get surface => theme.colorScheme.surface;
  Color get onSurface => theme.colorScheme.onSurface;
  Color get primary => theme.colorScheme.primary;
  Color get onPrimary => theme.colorScheme.onPrimary;

  Color get fillColor => theme.inputDecorationTheme.fillColor!;
  Color get iconColor1 => theme.iconTheme.color!;
  Color get buttonTextColor => theme.textTheme.labelLarge!.color!;
  Color get progressIndicatorColor => theme.progressIndicatorTheme.color!;

  InputDecorationTheme get inputDecorationTheme => theme.inputDecorationTheme;

  // InputBorder get enabledBorder => inputDecorationTheme.enabledBorder!;
  // InputBorder get focusedBorder => inputDecorationTheme.focusedBorder!;
  // InputBorder get errorBorder => inputDecorationTheme.errorBorder!;
  // InputBorder get focusedErrorBorder =>
  //     inputDecorationTheme.focusedErrorBorder!;

  // Context Text Styles
  TextStyle get headline1 => theme.textTheme.displayLarge!;
  TextStyle get headline2 => theme.textTheme.displayMedium!;
  TextStyle get headline3 => theme.textTheme.displaySmall!;
  TextStyle get headline4 => theme.textTheme.headlineMedium!;
  TextStyle get headline5 => theme.textTheme.headlineSmall!;
  TextStyle get headline6 => theme.textTheme.titleLarge!;
  TextStyle get headlineLarge => theme.textTheme.headlineLarge!;
  TextStyle get headlineMedium => theme.textTheme.headlineMedium!;
  TextStyle get headlineSmall => theme.textTheme.headlineSmall!;

  TextStyle get titleLarge => theme.textTheme.titleLarge!;
  TextStyle get titleMedium => theme.textTheme.titleMedium!;
  TextStyle get titleSmall => theme.textTheme.titleSmall!;

  TextStyle get labelLarge => theme.textTheme.labelLarge!;
  TextStyle get labelMedium => theme.textTheme.labelMedium!;
  TextStyle get labelSmall => theme.textTheme.labelSmall!;

  TextStyle get bodyText1 => theme.textTheme.bodyLarge!;
  TextStyle get bodyText2 => theme.textTheme.bodyMedium!;
  TextStyle get bodyLarge => theme.textTheme.bodyLarge!;
  TextStyle get bodyMedium => theme.textTheme.bodyMedium!;
  TextStyle get bodySmall => theme.textTheme.bodySmall!;

  TextStyle get subtitle1 => theme.textTheme.titleMedium!;
  TextStyle get subtitle2 => theme.textTheme.titleSmall!;

  TextStyle get captionLarge =>
      captionMedium.copyWith(fontSize: Sizes.TEXT_SIZE_14);
  TextStyle get captionMedium => theme.textTheme.bodySmall!;
  TextStyle get captionSmall =>
      captionMedium.copyWith(fontSize: Sizes.TEXT_SIZE_10);

  double get statusBarHeight => _mediaQuery.padding.top;
  double get appBarHeight => _mediaQuery.padding.top + kToolbarHeight;
}
