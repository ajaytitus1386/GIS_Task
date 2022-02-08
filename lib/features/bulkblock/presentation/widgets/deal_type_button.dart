import 'package:flutter/material.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/color_palettes.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/responsive_size.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/text_styles.dart';

// Used to filter the fetched deals based on the attribute DealType
class DealTypeButton extends StatelessWidget {
  const DealTypeButton({
    Key? key,
    required this.dealFunction,
    required this.dealTitle,
    required this.isSelected,
  }) : super(key: key);

  final Function() dealFunction;
  final String dealTitle;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.tileWidth,
      decoration: BoxDecoration(
          color: mapDealTypeToColor(dealTitle),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: isSelected ? textGray : Colors.transparent,
              style: BorderStyle.solid,
              width: 2)),
      child: TextButton(
        onPressed: dealFunction,
        child: Text(
          dealTitle,
          style: buildDealTypeStyle(isSelected: isSelected),
        ),
      ),
    );
  }

  Color mapDealTypeToColor(String dealType) {
    switch (dealType) {
      case 'All':
        return pacificBlue;
      case 'Buy':
        return buyGreen;
      case 'Sell':
        return sellRed;
      default:
        return pacificBlue;
    }
  }
}
