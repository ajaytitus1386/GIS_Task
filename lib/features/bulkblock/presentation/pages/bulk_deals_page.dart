import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gis_task/features/bulkblock/presentation/bloc/bulkblock_bloc.dart';
import 'package:gis_task/features/bulkblock/presentation/global/event_dispatchers.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/color_palettes.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/responsive_size.dart';
import 'package:gis_task/features/bulkblock/presentation/widgets/bulkblock_list_builder.dart';

class BulkDealsPage extends StatefulWidget {
  final String dealTypeSelected;
  const BulkDealsPage({Key? key, required this.dealTypeSelected})
      : super(key: key);

  @override
  State<BulkDealsPage> createState() => _BulkDealsPageState();
}

class _BulkDealsPageState extends State<BulkDealsPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // Get bulk deals by deal type
    if (widget.dealTypeSelected == 'All') {
      dispatchGetAllBulkDeals(context);
    } else if (widget.dealTypeSelected == 'Buy') {
      dispatchGetBulkDealsByDealType(context, 'Buy');
    } else if (widget.dealTypeSelected == 'Sell') {
      dispatchGetBulkDealsByDealType(context, 'Sell');
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
