import 'dart:convert';

import 'package:gis_task/features/bulkblock/domain/entities/bulkblock.dart';

List<BulkBlockModel> bulkblocksFromJson(String str) {
  final responseJsonMap = json.decode(str);
  final dataMap = responseJsonMap["Data"];

  return List<BulkBlockModel>.from(
      dataMap.map((bulkBlockJson) => BulkBlockModel.fromMap(bulkBlockJson)));
}

String bulkblockToJson(List<BulkBlockModel> bulkblocks) {
  final result =
      List<dynamic>.from(bulkblocks.map((bulkblock) => bulkblock.toMap()));
  final jsonMap = {
    "Data": result,
  };
  return json.encode(jsonMap);
}

class BulkBlockModel extends BulkBlock {
  const BulkBlockModel({
    required String finCode,
    required String clientName,
    required String dealType,
    required int quantity,
    required double value,
    required double tradePrice,
    required DateTime dealDate,
    required String exchange,
  }) : super(
          finCode: finCode,
          clientName: clientName,
          dealType: dealType,
          quantity: quantity,
          value: value,
          tradePrice: tradePrice,
          dealDate: dealDate,
          exchange: exchange,
        );

  factory BulkBlockModel.fromMap(Map<String, dynamic> map) {
    return BulkBlockModel(
      finCode: map["FinCode"] ?? '',
      clientName: map["ClientName"] ?? '',
      dealType: map["DealType"] ?? '',
      quantity: int.parse(map["Quantity"]),
      value: double.parse(map["Value"]),
      tradePrice: double.parse(map["TradePrice"]),
      dealDate: DateTime.parse(map["DealDate"]),
      exchange: map["Exchange"] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'FinCode': finCode,
      'ClientName': clientName,
      'DealtType': dealType,
      'Quantity': quantity.toString(),
      'Value': value.toString(),
      'TradePrice': tradePrice.toString(),
      'Dealdate': dealDate.toString(),
      'Exchange': exchange
    };
  }
}
