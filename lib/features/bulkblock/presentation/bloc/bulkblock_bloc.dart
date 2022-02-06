import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gis_task/core/error/failures.dart';
import 'package:gis_task/core/usecases/usecase.dart';
import 'package:gis_task/features/bulkblock/domain/entities/bulkblock.dart';
import 'package:gis_task/features/bulkblock/domain/usecases/fetch_block_deal_from_api.dart';
import 'package:gis_task/features/bulkblock/domain/usecases/fetch_bulk_deal_from_api.dart';

part 'bulkblock_event.dart';
part 'bulkblock_state.dart';

const String serverFailureMessage = 'Server Failure';

class BulkblockBloc extends Bloc<BulkblockEvent, BulkblockState> {
  final FetchBulkDealFromApi fetchBulkDealFromApi;
  final FetchBlockDealFromApi fetchBlockDealFromApi;

  BulkblockBloc({
    required this.fetchBulkDealFromApi,
    required this.fetchBlockDealFromApi,
  }) : super(BulkblockInitial()) {
    on<BulkblockEvent>((event, emit) {
      emit(BulkblockInitial());
    });
    on<GetAllBulkDeals>((event, emit) async {
      emit(BulkblockLoading());
      final failureOrBulkDeals = await fetchBulkDealFromApi(NoParams());
      emit(eitherFailureOrBulkBlocks(failureOrBulkDeals));
    });
    on<GetAllBlockDeals>((event, emit) async {
      emit(BulkblockLoading());
      final failureOrBlockDeals = await fetchBlockDealFromApi(NoParams());
      emit(eitherFailureOrBulkBlocks(failureOrBlockDeals));
    });
    on<GetBulkDealsByDealType>((event, emit) async {
      emit(BulkblockLoading());
      final failureOrBulkDeals = await fetchBulkDealFromApi(NoParams());
      emit(eitherFailureOrBulkBlocksByDealType(
          failureOrBulkDeals, event.dealType));
    });
    on<GetBlockDealsByDealType>((event, emit) async {
      emit(BulkblockLoading());
      final failureOrBlockDeals = await fetchBlockDealFromApi(NoParams());
      emit(eitherFailureOrBulkBlocksByDealType(
          failureOrBlockDeals, event.dealType));
    });
  }

  BulkblockState eitherFailureOrBulkBlocks(
      Either<Failure, List<BulkBlock>> failureOrBulkBlocks) {
    return failureOrBulkBlocks.fold(
        (failure) => BulkblockError(message: _mapFailureToMessage(failure)),
        (bulkBlockList) => BulkblockLoaded(bulkBlockList: bulkBlockList));
  }

  BulkblockState eitherFailureOrBulkBlocksByDealType(
      Either<Failure, List<BulkBlock>> failureOrBulkBlocks,
      String dealTypeToSelect) {
    return failureOrBulkBlocks.fold(
        (failure) => BulkblockError(message: _mapFailureToMessage(failure)),
        (bulkBlockList) {
      final result = bulkBlockList
          .where((bulkBlock) =>
              bulkBlock.dealType == dealTypeToSelect.toUpperCase())
          .toList();

      return BulkblockLoaded(bulkBlockList: result);
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
