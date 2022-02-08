import 'package:dartz/dartz.dart';
import 'package:gis_task/core/error/failures.dart';
import 'package:gis_task/features/bulkblock/domain/entities/bulkblock.dart';

abstract class BulkBlockRepo {
  /// Fetch Bulk Deals from API endpoint
  ///
  /// Returns [ServerFailure] if data could not be fetched
  Future<Either<Failure, List<BulkBlock>>> fetchBulkDealsFromApi();

  /// Fetches Block deals from API endpoint
  ///
  /// Returns [ServerFailure] if data could not be fetched
  Future<Either<Failure, List<BulkBlock>>> fetchBlockDealsFromApi();
}
