import 'package:gis_task/core/error/exceptions.dart';
import 'package:gis_task/features/bulkblock/data/models/bulkblock_model.dart';
import 'package:http/http.dart' as http;

abstract class BulkBlockRemoteDataSource {
  ///Fetchs the Bulk Deals API endpoint
  ///
  ///Throws [ServerException] on failed response
  Future<List<BulkBlockModel>> fetchBulkDeals();

  ///Fetchs the Block Deals API endpoint
  ///
  ///Throws [ServerException] on failed response
  Future<List<BulkBlockModel>> fetchBlockDeals();
}

class BulkBlockRemoteDataSourceImpl implements BulkBlockRemoteDataSource {
  final http.Client client;

  BulkBlockRemoteDataSourceImpl({required this.client});

  @override
  Future<List<BulkBlockModel>> fetchBulkDeals() async {
    return await _getBulkBlockFromUrl(
        "https://www.goindiastocks.com/api/service/GetBulkBlockDeal?fincode=100114&DealType=Bulk_Deal");
  }

  @override
  Future<List<BulkBlockModel>> fetchBlockDeals() async {
    return await _getBulkBlockFromUrl(
        "https://www.goindiastocks.com/api/service/GetBulkBlockDeal?fincode=100114&DealType=Block_Deal");
  }

  Future<List<BulkBlockModel>> _getBulkBlockFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {"Content-Type": 'application/json'});
    if (response.statusCode == 200) {
      final result = bulkblocksFromJson(response.body);
      return result;
    } else {
      throw ServerException();
    }
  }
}
