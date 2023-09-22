import 'package:flutter/material.dart';
import 'package:mystique/mystique.dart';

class AppTheme {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? ThemeColors.darkTheme : ThemeColors.lightTheme;
  }

  static Color backgroundColor = ThemeColors.darkTheme.primaryColor;
}

class ThemeColors {
  const ThemeColors._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'TT-Commons',
    primaryColor: kcRevolutWhite,

    scaffoldBackgroundColor: kcRevolutWhite,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.light().copyWith(primary: kcBlackErie, secondary: kcGreySpanish),
    appBarTheme: const AppBarTheme(
      backgroundColor: kcRevolutWhite,
    ),

    /// tab bar theme
    tabBarTheme: TabBarTheme(
      indicatorColor: kcRevolutWhite, // Color for the indicator in tabs for light theme
    ),

    /// text theme
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: kcBlackFull),
      bodyMedium: TextStyle(color: kcBlackFull),
    ),

    ///button colors:
    buttonTheme: const ButtonThemeData(
      buttonColor: kcRevolutWhite, // background color for RaisedButtons
      textTheme: ButtonTextTheme.primary, // color for text on the button
    ),
    iconTheme: const IconThemeData(
      color: kcRevolutWhite, // default color for IconButtons and other icons
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kcRevolutWhite, // background color for FAB
      foregroundColor: kcBlackCarbon, // icon color for FAB
    ),

    ///elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return kcRevolutWhite.withOpacity(0.8); // Color when the button is pressed
            }
            return kcRevolutWhite; // Default color
          },
        ),
        foregroundColor: MaterialStateProperty.all(kcBlackCarbon), // text/icon color
      ),
    ),
  );

  /// DARK THEME
  /// CONFIGURED
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'TT-Commons',
    primaryColor: kcWhiteCultured,
    scaffoldBackgroundColor: kcDarkGreyColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      //DISPLAY
      displayLarge: TextStyle(color: kcWhiteCultured),
      displayMedium: TextStyle(color: kcWhiteCultured),
      displaySmall: TextStyle(color: kcWhiteCultured),
      //HEADLINE
      headlineLarge: TextStyle(color: kcWhiteCultured),
      headlineMedium: TextStyle(color: kcWhiteCultured),
      headlineSmall: TextStyle(color: kcWhiteCultured),
      //TITLE
      titleLarge: TextStyle(color: kcWhiteCultured),
      titleMedium: TextStyle(color: kcWhiteCultured),
      titleSmall: TextStyle(color: kcWhiteCultured),
      //LABEL
      labelLarge: TextStyle(color: kcWhiteCultured),
      labelMedium: TextStyle(color: kcWhiteCultured),
      labelSmall: TextStyle(color: kcWhiteCultured),
      //BODY
      bodyLarge: TextStyle(color: kcWhiteCultured),
      bodyMedium: TextStyle(color: kcWhiteCultured),
      bodySmall: TextStyle(color: kcWhiteCultured),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
    ),
  );
}

extension ThemeExtras on ThemeData {
  Color get navBarColor => brightness == Brightness.light ? kcBlackCarbon : kcWhiteCultured;

  //
  Color get textColor => brightness == Brightness.light ? kcBlackCarbon : kcWhiteCultured;

  //
  Color get secondaryColor => Colors.redAccent;

  //
  Gradient get serviceCard => brightness == Brightness.light ? grayWhite : grayBack;

  //
  Gradient get contactCard => brightness == Brightness.light ? grayBack : grayWhite;
}

class AppThemeUtil {
  static AppThemeUtil? _instance;

  final context;

  AppThemeUtil._(this.context);

  factory AppThemeUtil(context) => _instance ??= AppThemeUtil._(context);

  static void init(context) {
    AppThemeUtil(context);
  }

  get theme => Theme.of(context);
}

const grayBack = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0XFF2E2D36), Color(0XFF11101D)],
);

const grayWhite = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFFFFF), Color(0xFFF3F2FF)],
);
