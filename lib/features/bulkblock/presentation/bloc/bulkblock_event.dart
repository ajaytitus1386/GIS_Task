part of 'bulkblock_bloc.dart';

abstract class BulkblockEvent extends Equatable {
  const BulkblockEvent();

  @override
  List<Object> get props => [];
}

class GetAllBulkDeals extends BulkblockEvent {}

class GetAllBlockDeals extends BulkblockEvent {}

class GetBulkDealsByDealType extends BulkblockEvent {
  final String dealType;

  const GetBulkDealsByDealType(this.dealType);
}

class GetBlockDealsByDealType extends BulkblockEvent {
  final String dealType;

  const GetBlockDealsByDealType(this.dealType);
}
