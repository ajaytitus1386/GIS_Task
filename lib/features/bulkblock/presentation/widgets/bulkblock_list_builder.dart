import 'package:flutter/material.dart';
import 'package:gis_task/features/bulkblock/domain/entities/bulkblock.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/text_styles.dart';
import 'package:gis_task/features/bulkblock/presentation/widgets/bulk_deal_card.dart';

class BulkBlockListBuilder extends StatefulWidget {
  final List<BulkBlock> bulkBlockList;
  final String clientNameToFilter;
  const BulkBlockListBuilder(
      {Key? key, required this.bulkBlockList, required this.clientNameToFilter})
      : super(key: key);

  @override
  State<BulkBlockListBuilder> createState() => _BulkBlockListBuilderState();
}

class _BulkBlockListBuilderState extends State<BulkBlockListBuilder> {
  @override
  Widget build(BuildContext context) {
    //Filters the bulkBlock list based on the search bar input
    List<BulkBlock> filteredBulkBlockList = widget.bulkBlockList
        .where((bulkBlock) => bulkBlock.clientName
            .contains(widget.clientNameToFilter.toUpperCase()))
        .toList();
    if (widget.clientNameToFilter == '') {
      filteredBulkBlockList = widget.bulkBlockList;
    }
    return Expanded(
      child: filteredBulkBlockList.isNotEmpty
          ? Scrollbar(
              isAlwaysShown: true,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: filteredBulkBlockList.length,
                itemBuilder: (context, index) {
                  return BulkDealCard(bulkBlock: filteredBulkBlockList[index]);
                },
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'No results found',
                style: buildNoResultsStyle(),
              ),
            ),
    );
  }
}
