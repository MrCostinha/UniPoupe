import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

const blue = Color(0xFF0069A7);
const yellow = Color(0xFFE3C03D);
const green = Color(0xFF01722B);

CustomColors lightCustomColors = const CustomColors(
  sourceBlue: Color(0xFF0069A7),
  blue: Color(0xFF00629D),
  onBlue: Color(0xFFFFFFFF),
  blueContainer: Color(0xFFCFE5FF),
  onBlueContainer: Color(0xFF001D33),
  sourceYellow: Color(0xFFE3C03D),
  yellow: Color(0xFF715C00),
  onYellow: Color(0xFFFFFFFF),
  yellowContainer: Color(0xFFFFE17B),
  onYellowContainer: Color(0xFF231B00),
  sourceGreen: Color(0xFF01722B),
  green: Color(0xFF006E29),
  onGreen: Color(0xFFFFFFFF),
  greenContainer: Color(0xFF98F8A0),
  onGreenContainer: Color(0xFF002107),
);

CustomColors darkCustomColors = const CustomColors(
  sourceBlue: Color(0xFF0069A7),
  blue: Color(0xFF99CBFF),
  onBlue: Color(0xFF003354),
  blueContainer: Color(0xFF004A78),
  onBlueContainer: Color(0xFFCFE5FF),
  sourceYellow: Color(0xFFE3C03D),
  yellow: Color(0xFFE7C440),
  onYellow: Color(0xFF3B2F00),
  yellowContainer: Color(0xFF564500),
  onYellowContainer: Color(0xFFFFE17B),
  sourceGreen: Color(0xFF01722B),
  green: Color(0xFF7CDB86),
  onGreen: Color(0xFF003912),
  greenContainer: Color(0xFF00531D),
  onGreenContainer: Color(0xFF98F8A0),
);

/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceBlue,
    required this.blue,
    required this.onBlue,
    required this.blueContainer,
    required this.onBlueContainer,
    required this.sourceYellow,
    required this.yellow,
    required this.onYellow,
    required this.yellowContainer,
    required this.onYellowContainer,
    required this.sourceGreen,
    required this.green,
    required this.onGreen,
    required this.greenContainer,
    required this.onGreenContainer,
  });

  final Color? sourceBlue;
  final Color? blue;
  final Color? onBlue;
  final Color? blueContainer;
  final Color? onBlueContainer;
  final Color? sourceYellow;
  final Color? yellow;
  final Color? onYellow;
  final Color? yellowContainer;
  final Color? onYellowContainer;
  final Color? sourceGreen;
  final Color? green;
  final Color? onGreen;
  final Color? greenContainer;
  final Color? onGreenContainer;

  @override
  CustomColors copyWith({
    Color? sourceBlue,
    Color? blue,
    Color? onBlue,
    Color? blueContainer,
    Color? onBlueContainer,
    Color? sourceYellow,
    Color? yellow,
    Color? onYellow,
    Color? yellowContainer,
    Color? onYellowContainer,
    Color? sourceGreen,
    Color? green,
    Color? onGreen,
    Color? greenContainer,
    Color? onGreenContainer,
  }) {
    return CustomColors(
      sourceBlue: sourceBlue ?? this.sourceBlue,
      blue: blue ?? this.blue,
      onBlue: onBlue ?? this.onBlue,
      blueContainer: blueContainer ?? this.blueContainer,
      onBlueContainer: onBlueContainer ?? this.onBlueContainer,
      sourceYellow: sourceYellow ?? this.sourceYellow,
      yellow: yellow ?? this.yellow,
      onYellow: onYellow ?? this.onYellow,
      yellowContainer: yellowContainer ?? this.yellowContainer,
      onYellowContainer: onYellowContainer ?? this.onYellowContainer,
      sourceGreen: sourceGreen ?? this.sourceGreen,
      green: green ?? this.green,
      onGreen: onGreen ?? this.onGreen,
      greenContainer: greenContainer ?? this.greenContainer,
      onGreenContainer: onGreenContainer ?? this.onGreenContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceBlue: Color.lerp(sourceBlue, other.sourceBlue, t),
      blue: Color.lerp(blue, other.blue, t),
      onBlue: Color.lerp(onBlue, other.onBlue, t),
      blueContainer: Color.lerp(blueContainer, other.blueContainer, t),
      onBlueContainer: Color.lerp(onBlueContainer, other.onBlueContainer, t),
      sourceYellow: Color.lerp(sourceYellow, other.sourceYellow, t),
      yellow: Color.lerp(yellow, other.yellow, t),
      onYellow: Color.lerp(onYellow, other.onYellow, t),
      yellowContainer: Color.lerp(yellowContainer, other.yellowContainer, t),
      onYellowContainer:
          Color.lerp(onYellowContainer, other.onYellowContainer, t),
      sourceGreen: Color.lerp(sourceGreen, other.sourceGreen, t),
      green: Color.lerp(green, other.green, t),
      onGreen: Color.lerp(onGreen, other.onGreen, t),
      greenContainer: Color.lerp(greenContainer, other.greenContainer, t),
      onGreenContainer: Color.lerp(onGreenContainer, other.onGreenContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///   * [CustomColors.sourceBlue]
  ///   * [CustomColors.blue]
  ///   * [CustomColors.onBlue]
  ///   * [CustomColors.blueContainer]
  ///   * [CustomColors.onBlueContainer]
  ///   * [CustomColors.sourceYellow]
  ///   * [CustomColors.yellow]
  ///   * [CustomColors.onYellow]
  ///   * [CustomColors.yellowContainer]
  ///   * [CustomColors.onYellowContainer]
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
      sourceBlue: sourceBlue!.harmonizeWith(dynamic.primary),
      blue: blue!.harmonizeWith(dynamic.primary),
      onBlue: onBlue!.harmonizeWith(dynamic.primary),
      blueContainer: blueContainer!.harmonizeWith(dynamic.primary),
      onBlueContainer: onBlueContainer!.harmonizeWith(dynamic.primary),
      sourceYellow: sourceYellow!.harmonizeWith(dynamic.primary),
      yellow: yellow!.harmonizeWith(dynamic.primary),
      onYellow: onYellow!.harmonizeWith(dynamic.primary),
      yellowContainer: yellowContainer!.harmonizeWith(dynamic.primary),
      onYellowContainer: onYellowContainer!.harmonizeWith(dynamic.primary),
    );
  }
}
