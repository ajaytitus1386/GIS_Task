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

// class GetBulkdealsByClientName extends BulkblockEvent {
//   final String clientName;

//   const GetBulkdealsByClientName(this.clientName);
// }

class GetBlockDealsByDealType extends BulkblockEvent {
  final String dealType;

  const GetBlockDealsByDealType(this.dealType);
}

// class GetBlockDealsByClientName extends BulkblockEvent {
//   final String clientName;

//   const GetBlockDealsByClientName(this.clientName);
// }
