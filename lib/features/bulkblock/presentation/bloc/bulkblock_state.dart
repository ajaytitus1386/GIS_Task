part of 'bulkblock_bloc.dart';

abstract class BulkblockState extends Equatable {
  const BulkblockState();

  @override
  List<Object> get props => [];
}

class BulkblockInitial extends BulkblockState {}

class BulkblockLoading extends BulkblockState {}

class BulkblockLoaded extends BulkblockState {
  final List<BulkBlock> bulkBlockList;

  const BulkblockLoaded({required this.bulkBlockList});
}

class BulkblockError extends BulkblockState {
  final String message;

  const BulkblockError({required this.message});
}
