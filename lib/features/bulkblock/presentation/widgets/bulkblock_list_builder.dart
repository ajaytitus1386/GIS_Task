import 'package:flutter/material.dart';
import 'package:gis_task/features/bulkblock/domain/entities/bulkblock.dart';
import 'package:gis_task/features/bulkblock/presentation/widgets/bulk_deal_card.dart';

class BulkBlockListBuilder extends StatefulWidget {
  final List<BulkBlock> bulkBlockList;
  const BulkBlockListBuilder({Key? key, required this.bulkBlockList})
      : super(key: key);

  @override
  State<BulkBlockListBuilder> createState() => _BulkBlockListBuilderState();
}

class _BulkBlockListBuilderState extends State<BulkBlockListBuilder> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: widget.bulkBlockList.length,
          itemBuilder: (context, index) {
            return BulkDealCard(bulkBlock: widget.bulkBlockList[index]);
          },
        ),
      ),
    );
  }
}
