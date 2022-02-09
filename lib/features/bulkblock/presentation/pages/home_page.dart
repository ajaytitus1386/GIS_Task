import 'package:flutter/material.dart';
import 'package:gis_task/features/bulkblock/presentation/global/event_dispatchers.dart';
import 'package:gis_task/features/bulkblock/presentation/pages/bulk_block_deals_page.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/color_palettes.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/responsive_size.dart';
import 'package:gis_task/features/bulkblock/presentation/widgets/bulk_block_deal_button.dart';
import 'package:gis_task/features/bulkblock/presentation/widgets/client_name_search_bar.dart';
import 'package:gis_task/features/bulkblock/presentation/widgets/deal_type_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isBulkDealTypeSelected = true;
  String dealTypeSelected = 'All';
  String clientNameFromTextField = '';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Bulk or Block Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BulkBlockDealButton(
                    dealFunction: () {
                      setState(() {
                        isBulkDealTypeSelected = true;
                      });
                    },
                    buttonText: 'Bulk Deal',
                    isSelected: isBulkDealTypeSelected),
                BulkBlockDealButton(
                    dealFunction: () {
                      setState(() {
                        isBulkDealTypeSelected = false;
                      });
                    },
                    buttonText: 'Block Deal',
                    isSelected: !isBulkDealTypeSelected),
              ],
            ),
            // Filters based on deal type
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DealTypeButton(
                      dealFunction: () {
                        setState(() {
                          dealTypeSelected = 'All';
                        });
                      },
                      dealTitle: 'All',
                      isSelected: dealTypeSelected == 'All'),
                  DealTypeButton(
                      dealFunction: () {
                        setState(() {
                          dealTypeSelected = 'Buy';
                        });
                      },
                      dealTitle: 'Buy',
                      isSelected: dealTypeSelected == 'Buy'),
                  DealTypeButton(
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
            // Search Bar for client Name
            ClientNameSearchBar(
              clientNameFromTextField: clientNameFromTextField,
              controller: controller,
              changeClientName: changeClientName,
            ),
            // Display the Bulk or Block Deals
            if (isBulkDealTypeSelected)
              BulkBlockDealsPage(
                dealTypeSelected: dealTypeSelected,
                clientNameToFilter: clientNameFromTextField,
                getBulkOrBlockDeals: () =>
                    getAllBulkDealsByDealType(context, dealTypeSelected),
              )
            else
              BulkBlockDealsPage(
                dealTypeSelected: dealTypeSelected,
                clientNameToFilter: clientNameFromTextField,
                getBulkOrBlockDeals: () =>
                    getAllBlockDealsByDealType(context, dealTypeSelected),
              )
          ],
        ),
      ),
    );
  }

  void changeClientName(String enteredClientName) {
    setState(() {
      clientNameFromTextField = enteredClientName;
    });
  }
}
