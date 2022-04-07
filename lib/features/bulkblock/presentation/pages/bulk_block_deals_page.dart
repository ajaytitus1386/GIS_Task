import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gis_task/features/bulkblock/presentation/cubit/bulkcube_cubit.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/color_palettes.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/responsive_size.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/text_styles.dart';
import 'package:gis_task/features/bulkblock/presentation/widgets/bulkblock_list_builder.dart';

class BulkBlockDealsPage extends StatefulWidget {
  final String dealTypeSelected;
  final String clientNameToFilter;
  final VoidCallback getBulkOrBlockDeals;
  const BulkBlockDealsPage(
      {Key? key,
      required this.dealTypeSelected,
      required this.clientNameToFilter,
      required this.getBulkOrBlockDeals})
      : super(key: key);

  @override
  State<BulkBlockDealsPage> createState() => _BulkBlockDealsPageState();
}

class _BulkBlockDealsPageState extends State<BulkBlockDealsPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // dispatch events to load bulk or block deals state
    widget.getBulkOrBlockDeals();

    return BlocBuilder<BulkcubeCubit, BulkcubeState>(builder: (context, state) {
      if (state is BulkcubeInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is BulkcubeLoaded) {
        return BulkBlockListBuilder(
          bulkBlockList: state.bulkBlockList,
          clientNameToFilter: widget.clientNameToFilter,
        );
      } else if (state is BulkcubeError) {
        return Text(
          'Unable to fetch deals:\n' + state.message,
          style: buildNoResultsStyle(),
          textAlign: TextAlign.center,
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
