import 'package:equatable/equatable.dart';

class BulkBlock extends Equatable {
  final String finCode;
  final String clientName;
  final String dealType;
  final int quantity;
  final double value;
  final double tradePrice;
  final DateTime dealDate;
  final String exchange;

  const BulkBlock({
    required this.finCode,
    required this.clientName,
    required this.dealType,
    required this.quantity,
    required this.value,
    required this.tradePrice,
    required this.dealDate,
    required this.exchange,
  });

  @override
  List<Object?> get props => [
        finCode,
        clientName,
        dealType,
        quantity,
        value,
        tradePrice,
        dealDate,
        exchange
      ];
}
