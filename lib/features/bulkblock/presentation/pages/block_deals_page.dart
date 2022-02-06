import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gis_task/features/bulkblock/presentation/bloc/bulkblock_bloc.dart';
import 'package:gis_task/features/bulkblock/presentation/global/event_dispatchers.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/color_palettes.dart';
import 'package:gis_task/features/bulkblock/presentation/widgets/bulkblock_list_builder.dart';

class BlockDealsPage extends StatefulWidget {
  final String dealTypeSelected;
  const BlockDealsPage({Key? key, required this.dealTypeSelected})
      : super(key: key);

  @override
  State<BlockDealsPage> createState() => _BlockDealsPageState();
}

class _BlockDealsPageState extends State<BlockDealsPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.dealTypeSelected == 'All') {
      dispatchGetAllBlockDeals(context);
    } else if (widget.dealTypeSelected == 'Buy') {
      dispatchGetBlockDealsByDealType(context, 'Buy');
    } else if (widget.dealTypeSelected == 'Sell') {
      dispatchGetBlockDealsByDealType(context, 'Sell');
    }
    return BlocBuilder<BulkblockBloc, BulkblockState>(
        builder: (context, state) {
      if (state is BulkblockInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is BulkblockLoaded) {
        return BulkBlockListBuilder(
          bulkBlockList: state.bulkBlockList,
        );
      }
      return Center(
        child: CircularProgressIndicator(
          color: blueNCS,
        ),
      );
    });
  }
}
