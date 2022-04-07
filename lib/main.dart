import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gis_task/core/network/network_info.dart';
import 'package:gis_task/features/bulkblock/data/datasources/bulkblock_remote_data_sources.dart';
import 'package:gis_task/features/bulkblock/data/repos/bulkblock_repo_impl.dart';
import 'package:gis_task/features/bulkblock/presentation/cubit/bulkcube_cubit.dart';
import 'package:gis_task/features/bulkblock/presentation/pages/home_page.dart';
import 'package:gis_task/features/bulkblock/presentation/widgets/splash_screen_widget.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BulkcubeCubit>(
      create: (_) => BulkcubeCubit(
        BulkBlockRepoImpl(
          remoteDataSource: BulkBlockRemoteDataSourceImpl(client: Client()),
          networkInfo: NetworkInfoImpl(
            InternetConnectionChecker(),
          ),
        ),
      ),
      child: MaterialApp(
          title: 'GIS Task',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SafeArea(
              child: SplashScreenWidget(
            nextRoute: MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          ))),
    );
  }
}
