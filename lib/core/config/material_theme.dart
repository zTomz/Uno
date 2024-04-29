import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff7b5639),
      surfaceTint: Color(0xff7b5639),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd9aa88),
      onPrimaryContainer: Color(0xff3d2108),
      secondary: Color(0xff6e5a4c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfffde1cf),
      onSecondaryContainer: Color(0xff594739),
      tertiary: Color(0xff606137),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffb7b786),
      onTertiaryContainer: Color(0xff292a06),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffff8f5),
      onBackground: Color(0xff1f1b18),
      surface: Color(0xfffff8f5),
      onSurface: Color(0xff1f1b18),
      surfaceVariant: Color(0xfff1dfd4),
      onSurfaceVariant: Color(0xff50453d),
      outline: Color(0xff82746c),
      outlineVariant: Color(0xffd4c3b9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff342f2d),
      inverseOnSurface: Color(0xfff8efea),
      inversePrimary: Color(0xffeebd99),
      primaryFixed: Color(0xffffdcc4),
      onPrimaryFixed: Color(0xff2e1501),
      primaryFixedDim: Color(0xffeebd99),
      onPrimaryFixedVariant: Color(0xff613f24),
      secondaryFixed: Color(0xfff9ddcb),
      onSecondaryFixed: Color(0xff26190e),
      secondaryFixedDim: Color(0xffdcc2b0),
      onSecondaryFixedVariant: Color(0xff554336),
      tertiaryFixed: Color(0xffe6e5b1),
      onTertiaryFixed: Color(0xff1c1d00),
      tertiaryFixedDim: Color(0xffcac997),
      onTertiaryFixedVariant: Color(0xff484922),
      surfaceDim: Color(0xffe1d8d4),
      surfaceBright: Color(0xfffff8f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf2ed),
      surfaceContainer: Color(0xfff5ece7),
      surfaceContainerHigh: Color(0xfff0e6e2),
      surfaceContainerHighest: Color(0xffeae1dc),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff5c3b21),
      surfaceTint: Color(0xff7b5639),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff946c4d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff513f32),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff867062),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff44451e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff77774c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff8f5),
      onBackground: Color(0xff1f1b18),
      surface: Color(0xfffff8f5),
      onSurface: Color(0xff1f1b18),
      surfaceVariant: Color(0xfff1dfd4),
      onSurfaceVariant: Color(0xff4c4139),
      outline: Color(0xff695d54),
      outlineVariant: Color(0xff86786f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff342f2d),
      inverseOnSurface: Color(0xfff8efea),
      inversePrimary: Color(0xffeebd99),
      primaryFixed: Color(0xff946c4d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff795437),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff867062),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6c584a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff77774c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff5e5e35),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe1d8d4),
      surfaceBright: Color(0xfffff8f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf2ed),
      surfaceContainer: Color(0xfff5ece7),
      surfaceContainerHigh: Color(0xfff0e6e2),
      surfaceContainerHighest: Color(0xffeae1dc),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff361b04),
      surfaceTint: Color(0xff7b5639),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5c3b21),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2e1f14),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff513f32),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff232402),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff44451e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff8f5),
      onBackground: Color(0xff1f1b18),
      surface: Color(0xfffff8f5),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xfff1dfd4),
      onSurfaceVariant: Color(0xff2b221b),
      outline: Color(0xff4c4139),
      outlineVariant: Color(0xff4c4139),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff342f2d),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffffe8d9),
      primaryFixed: Color(0xff5c3b21),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff43260d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff513f32),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff39291e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff44451e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2e2e0a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe1d8d4),
      surfaceBright: Color(0xfffff8f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf2ed),
      surfaceContainer: Color(0xfff5ece7),
      surfaceContainerHigh: Color(0xfff0e6e2),
      surfaceContainerHighest: Color(0xffeae1dc),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff3c19e),
      surfaceTint: Color(0xffeebd99),
      onPrimary: Color(0xff472910),
      primaryContainer: Color(0xffc79978),
      onPrimaryContainer: Color(0xff281100),
      secondary: Color(0xffdcc2b0),
      onSecondary: Color(0xff3d2d21),
      secondaryContainer: Color(0xff4d3c2f),
      onSecondaryContainer: Color(0xffeacfbd),
      tertiary: Color(0xffcece9b),
      onTertiary: Color(0xff31320e),
      tertiaryContainer: Color(0xffa5a575),
      onTertiaryContainer: Color(0xff171800),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff161310),
      onBackground: Color(0xffeae1dc),
      surface: Color(0xff161310),
      onSurface: Color(0xffeae1dc),
      surfaceVariant: Color(0xff50453d),
      onSurfaceVariant: Color(0xffd4c3b9),
      outline: Color(0xff9d8e85),
      outlineVariant: Color(0xff50453d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1dc),
      inverseOnSurface: Color(0xff342f2d),
      inversePrimary: Color(0xff7b5639),
      primaryFixed: Color(0xffffdcc4),
      onPrimaryFixed: Color(0xff2e1501),
      primaryFixedDim: Color(0xffeebd99),
      onPrimaryFixedVariant: Color(0xff613f24),
      secondaryFixed: Color(0xfff9ddcb),
      onSecondaryFixed: Color(0xff26190e),
      secondaryFixedDim: Color(0xffdcc2b0),
      onSecondaryFixedVariant: Color(0xff554336),
      tertiaryFixed: Color(0xffe6e5b1),
      onTertiaryFixed: Color(0xff1c1d00),
      tertiaryFixedDim: Color(0xffcac997),
      onTertiaryFixedVariant: Color(0xff484922),
      surfaceDim: Color(0xff161310),
      surfaceBright: Color(0xff3d3835),
      surfaceContainerLowest: Color(0xff110d0b),
      surfaceContainerLow: Color(0xff1f1b18),
      surfaceContainer: Color(0xff231f1c),
      surfaceContainerHigh: Color(0xff2e2926),
      surfaceContainerHighest: Color(0xff393431),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff3c19e),
      surfaceTint: Color(0xffeebd99),
      onPrimary: Color(0xff281100),
      primaryContainer: Color(0xffc79978),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffe0c6b4),
      onSecondary: Color(0xff211309),
      secondaryContainer: Color(0xffa38c7d),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffcece9b),
      onTertiary: Color(0xff171800),
      tertiaryContainer: Color(0xffa5a575),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff161310),
      onBackground: Color(0xffeae1dc),
      surface: Color(0xff161310),
      onSurface: Color(0xfffffaf8),
      surfaceVariant: Color(0xff50453d),
      onSurfaceVariant: Color(0xffd8c8bd),
      outline: Color(0xffafa096),
      outlineVariant: Color(0xff8f8077),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1dc),
      inverseOnSurface: Color(0xff2e2926),
      inversePrimary: Color(0xff624025),
      primaryFixed: Color(0xffffdcc4),
      onPrimaryFixed: Color(0xff200c00),
      primaryFixedDim: Color(0xffeebd99),
      onPrimaryFixedVariant: Color(0xff4e2f15),
      secondaryFixed: Color(0xfff9ddcb),
      onSecondaryFixed: Color(0xff1b0e05),
      secondaryFixedDim: Color(0xffdcc2b0),
      onSecondaryFixedVariant: Color(0xff433326),
      tertiaryFixed: Color(0xffe6e5b1),
      onTertiaryFixed: Color(0xff121200),
      tertiaryFixedDim: Color(0xffcac997),
      onTertiaryFixedVariant: Color(0xff373813),
      surfaceDim: Color(0xff161310),
      surfaceBright: Color(0xff3d3835),
      surfaceContainerLowest: Color(0xff110d0b),
      surfaceContainerLow: Color(0xff1f1b18),
      surfaceContainer: Color(0xff231f1c),
      surfaceContainerHigh: Color(0xff2e2926),
      surfaceContainerHighest: Color(0xff393431),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffffaf8),
      surfaceTint: Color(0xffeebd99),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xfff2c19d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf8),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe0c6b4),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffec8),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffcece9b),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff161310),
      onBackground: Color(0xffeae1dc),
      surface: Color(0xff161310),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff50453d),
      onSurfaceVariant: Color(0xfffffaf8),
      outline: Color(0xffd8c8bd),
      outlineVariant: Color(0xffd8c8bd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1dc),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff40230a),
      primaryFixed: Color(0xffffe1cd),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xfff2c19d),
      onPrimaryFixedVariant: Color(0xff271000),
      secondaryFixed: Color(0xfffde2d0),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe0c6b4),
      onSecondaryFixedVariant: Color(0xff211309),
      tertiaryFixed: Color(0xffeaeab5),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffcece9b),
      onTertiaryFixedVariant: Color(0xff171700),
      surfaceDim: Color(0xff161310),
      surfaceBright: Color(0xff3d3835),
      surfaceContainerLowest: Color(0xff110d0b),
      surfaceContainerLow: Color(0xff1f1b18),
      surfaceContainer: Color(0xff231f1c),
      surfaceContainerHigh: Color(0xff2e2926),
      surfaceContainerHighest: Color(0xff393431),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
