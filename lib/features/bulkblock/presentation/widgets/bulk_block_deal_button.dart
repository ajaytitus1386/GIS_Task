import 'package:flutter/material.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/color_palettes.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/responsive_size.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/text_styles.dart';

// Used to switch between bulk deals and block deals pages
class BulkBlockDealButton extends StatelessWidget {
  const BulkBlockDealButton({
    Key? key,
    required this.dealFunction,
    required this.buttonText,
    required this.isSelected,
  }) : super(key: key);

  final Function() dealFunction;
  final String buttonText;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth / 2,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: isSelected ? outrageousOrange : Colors.transparent,
              width: 2.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
            onPressed: dealFunction,
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent)),
            child: Text(
              buttonText,
              style: buildTextButtonStyle(),
            )),
      ),
    );
  }
}
