import 'package:gis_task/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:gis_task/core/usecases/usecase.dart';
import 'package:gis_task/features/bulkblock/domain/entities/bulkblock.dart';
import 'package:gis_task/features/bulkblock/domain/repos/bulkblock_repo.dart';

class FetchBlockDealFromApi implements UseCase<List<BulkBlock>, NoParams> {
  final BulkBlockRepo repo;

  FetchBlockDealFromApi(this.repo);
  @override
  Future<Either<Failure, List<BulkBlock>>> call(NoParams params) async {
    return await repo.fetchBlockDealsFromApi();
  }
}
