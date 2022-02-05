import 'package:gis_task/core/error/exceptions.dart';
import 'package:gis_task/core/network/network_info.dart';
import 'package:gis_task/features/bulkblock/data/datasources/bulkblock_remote_data_sources.dart';
import 'package:gis_task/features/bulkblock/domain/entities/bulkblock.dart';
import 'package:gis_task/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:gis_task/features/bulkblock/domain/repos/bulkblock_repo.dart';

class BulkBlockRepoImpl implements BulkBlockRepo {
  final BulkBlockRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BulkBlockRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<BulkBlock>>> fetchBulkDealsFromApi() async {
    return await getBulkOrBlockDeals(() {
      return remoteDataSource.fetchBulkDeals();
    });
  }

  @override
  Future<Either<Failure, List<BulkBlock>>> fetchBlockDealsFromApi() async {
    return await getBulkOrBlockDeals(() {
      return remoteDataSource.fetchBlockDeals();
    });
  }

  Future<Either<Failure, List<BulkBlock>>> getBulkOrBlockDeals(
      Future<List<BulkBlock>> Function() remoteDataSourceCall) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteBlockDeals = await remoteDataSourceCall();
        return Right(remoteBlockDeals);
      } on ServerException {
        return Left(ServerFailure(message: 'Failed to fetch bulk block deals'));
      }
    } else {
      return Left(ServerFailure(message: 'Not Connected to internet'));
    }
  }
}
