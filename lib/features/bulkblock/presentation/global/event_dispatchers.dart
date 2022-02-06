import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gis_task/features/bulkblock/presentation/bloc/bulkblock_bloc.dart';

void dispatchGetAllBulkDeals(BuildContext context) {
  BlocProvider.of<BulkblockBloc>(context).add(GetAllBulkDeals());
}

void dispatchGetAllBlockDeals(BuildContext context) {
  BlocProvider.of<BulkblockBloc>(context).add(GetAllBlockDeals());
}

void dispatchGetBulkDealsByDealType(
    BuildContext context, String dealTypeToSelect) {
  BlocProvider.of<BulkblockBloc>(context)
      .add(GetBulkDealsByDealType(dealTypeToSelect));
}

void dispatchGetBlockDealsByDealType(
    BuildContext context, String dealTypeToSelect) {
  BlocProvider.of<BulkblockBloc>(context)
      .add(GetBlockDealsByDealType(dealTypeToSelect));
}
