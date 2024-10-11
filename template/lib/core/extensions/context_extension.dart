import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double dynamicWidth(double value) => width * value;
  double dynamicHeight(double value) => height * value;

  double get low2xValue => height * 0.003;
  double get lowValue => height * 0.006;
  double get normalValue => height * 0.02;
  double get highValue => height * 0.04;
}

extension PaddingExtension on BuildContext {

  EdgeInsets get paddinglow2xValue => EdgeInsets.all(low2xValue);
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
  EdgeInsets get horizontalLow => EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get horizontalNormal => EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get horizontalHigh => EdgeInsets.symmetric(horizontal: highValue);
  EdgeInsets get verticalLow => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get verticalNormal => EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get verticalHigh => EdgeInsets.symmetric(vertical: highValue);
  EdgeInsets get bottomLow => EdgeInsets.only(bottom: lowValue);
  EdgeInsets get topLow => EdgeInsets.only(top: lowValue);
  EdgeInsets get bottomNormal => EdgeInsets.only(bottom: normalValue);
  EdgeInsets get topNormal => EdgeInsets.only(top: normalValue);
  EdgeInsets get bottomHigh => EdgeInsets.only(bottom: highValue);
  EdgeInsets get topHigh => EdgeInsets.only(top: highValue);
  EdgeInsets get rightLow => EdgeInsets.only(right: lowValue);
  EdgeInsets get leftLow => EdgeInsets.only(left: lowValue);
  EdgeInsets get rightNormal => EdgeInsets.only(right: normalValue);
  EdgeInsets get leftNormal => EdgeInsets.only(left: normalValue);
  EdgeInsets get rightHigh => EdgeInsets.only(right: highValue);
  EdgeInsets get leftHigh => EdgeInsets.only(left: highValue * 5);
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}
