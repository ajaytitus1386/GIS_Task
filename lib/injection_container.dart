import 'package:get_it/get_it.dart';
import 'package:gis_task/core/network/network_info.dart';
import 'package:gis_task/features/bulkblock/data/datasources/bulkblock_remote_data_sources.dart';
import 'package:gis_task/features/bulkblock/data/repos/bulkblock_repo_impl.dart';
import 'package:gis_task/features/bulkblock/domain/repos/bulkblock_repo.dart';
import 'package:gis_task/features/bulkblock/domain/usecases/fetch_block_deal_from_api.dart';
import 'package:gis_task/features/bulkblock/domain/usecases/fetch_bulk_deal_from_api.dart';
import 'package:gis_task/features/bulkblock/presentation/bloc/bulkblock_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //!Features
  sl.registerFactory(() => BulkblockBloc(
        fetchBulkDealFromApi: sl(),
        fetchBlockDealFromApi: sl(),
      ));

  //Use Cases
  sl.registerLazySingleton(() => FetchBulkDealFromApi(sl()));
  sl.registerLazySingleton(() => FetchBlockDealFromApi(sl()));

  sl.registerLazySingleton<BulkBlockRepo>(() => BulkBlockRepoImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  // DataSources
  sl.registerLazySingleton<BulkBlockRemoteDataSource>(
      () => BulkBlockRemoteDataSourceImpl(client: sl()));

  //!Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External Dependencies
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
