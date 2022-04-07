import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gis_task/features/bulkblock/presentation/cubit/bulkcube_cubit.dart';

void dispatchGetAllBulkDeals(BuildContext context) {
  final bulkCubeCubit = context.read<BulkcubeCubit>();
  bulkCubeCubit.getAllBulkDeals();
}

void dispatchGetAllBlockDeals(BuildContext context) {
  final bulkCubeCubit = context.read<BulkcubeCubit>();
  bulkCubeCubit.getAllBlockDeals();
}

void dispatchGetBulkDealsByDealType(
    BuildContext context, String dealTypeToSelect) {
  final bulkCubeCubit = context.read<BulkcubeCubit>();
  bulkCubeCubit.getBulkDealsByDealType(dealTypeToSelect);
}

void dispatchGetBlockDealsByDealType(
    BuildContext context, String dealTypeToSelect) {
  final bulkCubeCubit = context.read<BulkcubeCubit>();
  bulkCubeCubit.getBlockDealsByDealType(dealTypeToSelect);
}

void getAllBlockDealsByDealType(BuildContext context, String dealTypeSelected) {
  if (dealTypeSelected == 'All') {
    dispatchGetAllBlockDeals(context);
  } else if (dealTypeSelected == 'Buy') {
    dispatchGetBlockDealsByDealType(context, 'Buy');
  } else if (dealTypeSelected == 'Sell') {
    dispatchGetBlockDealsByDealType(context, 'Sell');
  }
}

void getAllBulkDealsByDealType(BuildContext context, String dealTypeSelected) {
  if (dealTypeSelected == 'All') {
    dispatchGetAllBulkDeals(context);
  } else if (dealTypeSelected == 'Buy') {
    dispatchGetBulkDealsByDealType(context, 'Buy');
  } else if (dealTypeSelected == 'Sell') {
    dispatchGetBulkDealsByDealType(context, 'Sell');
  }
}
