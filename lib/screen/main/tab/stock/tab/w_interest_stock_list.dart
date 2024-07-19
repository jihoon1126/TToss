import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/dummy_interest_stocks.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/w_stock_item.dart';
import 'package:flutter/material.dart';

class InterestStockList extends StatelessWidget {
  const InterestStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(
      //   horizontal: 20,
      // ),
      color: context.backgroundColor,
      child: Column(
        children: [
          const Height(10),
          ...myInterestStocks
              .map(
                (e) => StockItem(
                  stock: e,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
