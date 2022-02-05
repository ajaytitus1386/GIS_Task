import 'package:dartz/dartz.dart';
import 'package:gis_task/core/error/failures.dart';
import 'package:gis_task/features/bulkblock/domain/entities/bulkblock.dart';

abstract class BulkBlockRepo {
  Future<Either<Failure, List<BulkBlock>>> fetchBulkDealsFromApi();
  Future<Either<Failure, List<BulkBlock>>> fetchBlockDealsFromApi();
}
