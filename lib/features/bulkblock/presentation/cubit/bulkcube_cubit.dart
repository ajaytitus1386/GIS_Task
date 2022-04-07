import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gis_task/core/error/failures.dart';
import 'package:gis_task/features/bulkblock/domain/entities/bulkblock.dart';
import 'package:gis_task/features/bulkblock/domain/repos/bulkblock_repo.dart';

part 'bulkcube_state.dart';

class BulkcubeCubit extends Cubit<BulkcubeState> {
  final BulkBlockRepo _bulkBlockrepo;

  BulkcubeCubit(this._bulkBlockrepo) : super(BulkcubeInitial());

  Future<void> getAllBlockDeals() async {
    emit(BulkcubeLoading());
    final bulkBlocks = await _bulkBlockrepo.fetchBlockDealsFromApi();
    bulkBlocks.fold(
      (l) => emit(
        BulkcubeError(l.toString()),
      ),
      (r) => emit(BulkcubeLoaded(r)),
    );
  }

  Future<void> getAllBulkDeals() async {
    emit(BulkcubeLoading());
    final bulkBlocks = await _bulkBlockrepo.fetchBulkDealsFromApi();
    bulkBlocks.fold(
      (l) => emit(
        BulkcubeError(l.toString()),
      ),
      (r) => emit(BulkcubeLoaded(r)),
    );
  }

  Future<void> getBlockDealsByDealType(String dealTypeToSelect) async {
    emit(BulkcubeLoading());
    final bulkBlocks = await _bulkBlockrepo.fetchBlockDealsFromApi();
    eitherFilteredBulkBlocksOrError(bulkBlocks, dealTypeToSelect);
  }

  Future<void> getBulkDealsByDealType(String dealTypeToSelect) async {
    emit(BulkcubeLoading());
    final bulkBlocks = await _bulkBlockrepo.fetchBulkDealsFromApi();
    eitherFilteredBulkBlocksOrError(bulkBlocks, dealTypeToSelect);
  }

  /// Either return [BulkcubeError] on failure
  ///
  /// Or filter through the result [BulkBlock] list and only select those where deal type matches
  void eitherFilteredBulkBlocksOrError(
      Either<Failure, List<BulkBlock>> bulkBlocks, String dealTypeToSelect) {
    return bulkBlocks.fold(
      (failure) {
        emit(BulkcubeError(failure.toString()));
      },
      (bulkBlockList) {
        final result = bulkBlockList
            .where((bulkBlock) =>
                bulkBlock.dealType == dealTypeToSelect.toUpperCase())
            .toList();
        emit(BulkcubeLoaded(result));
      },
    );
  }
}
