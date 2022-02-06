import 'package:flutter/material.dart';
import 'package:gis_task/features/bulkblock/presentation/pages/block_deals_page.dart';
import 'package:gis_task/features/bulkblock/presentation/pages/bulk_deals_page.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/color_palettes.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/responsive_size.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/text_styles.dart';
import 'package:gis_task/features/bulkblock/presentation/widgets/client_name_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isBulkDealTypeSelected = true;
  String dealTypeSelected = 'All';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Bulk or Block Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildBulkBlockDealButton(
                  dealFunction: () {
                    setState(() {
                      isBulkDealTypeSelected = true;
                    });
                  },
                  buttonText: 'Bulk Deals',
                  isSelected: isBulkDealTypeSelected),
              buildBulkBlockDealButton(
                  dealFunction: () {
                    setState(() {
                      isBulkDealTypeSelected = false;
                    });
                  },
                  buttonText: 'Block Deals',
                  isSelected: !isBulkDealTypeSelected),
            ],
          ),
          // Filters based on deal type
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildDealTypeButton(
                    dealFunction: () {
                      setState(() {
                        dealTypeSelected = 'All';
                      });
                    },
                    dealTitle: 'All',
                    isSelected: dealTypeSelected == 'All'),
                buildDealTypeButton(
                    dealFunction: () {
                      setState(() {
                        dealTypeSelected = 'Buy';
                      });
                    },
                    dealTitle: 'Buy',
                    isSelected: dealTypeSelected == 'Buy'),
                buildDealTypeButton(
                    dealFunction: () {
                      setState(() {
                        dealTypeSelected = 'Sell';
                      });
                    },
                    dealTitle: 'Sell',
                    isSelected: dealTypeSelected == 'Sell')
              ],
            ),
          ),
          const ClientNameSearchBar(),
          isBulkDealTypeSelected
              ? BulkDealsPage(
                  dealTypeSelected: dealTypeSelected,
                )
              : BlockDealsPage(
                  dealTypeSelected: dealTypeSelected,
                )
        ],
      ),
    );
  }

  Container buildDealTypeButton(
      {required Function() dealFunction,
      required String dealTitle,
      required bool isSelected}) {
    return Container(
      decoration: BoxDecoration(
          color: _mapDealTypeToColor(dealTitle),
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

  Color _mapDealTypeToColor(String dealType) {
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

  Container buildBulkBlockDealButton(
      {required Function() dealFunction,
      required String buttonText,
      required bool isSelected}) {
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
            child: Text(
              buttonText,
              style: buildTextButtonStyle(),
            )),
      ),
    );
  }
}
