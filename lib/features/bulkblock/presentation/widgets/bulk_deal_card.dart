import 'package:flutter/material.dart';
import 'package:gis_task/features/bulkblock/domain/entities/bulkblock.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/color_palettes.dart';
import 'package:gis_task/features/bulkblock/presentation/styling/responsive_size.dart';
import 'package:intl/intl.dart';

class BulkDealCard extends StatefulWidget {
  final BulkBlock bulkBlock;
  const BulkDealCard({Key? key, required this.bulkBlock}) : super(key: key);

  @override
  State<BulkDealCard> createState() => _BulkDealCardState();
}

class _BulkDealCardState extends State<BulkDealCard> {
  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat("dd MMM yyyy").format(widget.bulkBlock.dealDate);
    String formattedQuantity =
        NumberFormat("##,##,###").format(widget.bulkBlock.quantity);

    String formattedValue = widget.bulkBlock.value < 10000000.0
        ? widget.bulkBlock.value.toString()
        : (widget.bulkBlock.value / 10000000.0).toStringAsFixed(1) + ' Cr';

    bool isBuyDealType = widget.bulkBlock.dealType == "BUY";
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
      child: Container(
        width: SizeConfig.cardWidth,
        height: SizeConfig.cardHeight,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 5)
        ], color: highlight, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 4.0,
                height: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isBuyDealType ? buyGreen : sellRed),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Name and date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              widget.bulkBlock.clientName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: textGray,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Text(
                            formattedDate,
                            style: TextStyle(
                                color: midGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      // Quantity and tradeprice
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            (isBuyDealType ? "Bought " : "Sold ") +
                                formattedQuantity +
                                " shares",
                            style: TextStyle(
                                color: isBuyDealType ? buyGreen : sellRed,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '\t@ Rs ' +
                                widget.bulkBlock.tradePrice.toInt().toString(),
                            style: TextStyle(
                                color: textGray,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      // Value
                      Row(
                        children: [
                          Text(
                            'Value\tRs ' + formattedValue,
                            style: TextStyle(
                                color: blueNCS,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
