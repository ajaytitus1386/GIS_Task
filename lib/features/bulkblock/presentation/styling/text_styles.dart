import 'package:flutter/material.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/color_palettes.dart';

TextStyle buildTextButtonStyle() {
  return TextStyle(color: blueNCS, fontSize: 20, fontWeight: FontWeight.w400);
}

TextStyle buildDealTypeStyle({required bool isSelected}) {
  return TextStyle(
      color: isSelected ? textGray : highlight,
      fontSize: 20,
      fontWeight: FontWeight.w500);
}

TextStyle buildNoResultsStyle() {
  return TextStyle(
    color: textGray,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}
