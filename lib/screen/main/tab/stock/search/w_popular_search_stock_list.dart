import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/dummy_popualr_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_stock_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopularSearchStockList extends StatelessWidget {
  const PopularSearchStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(children: [
            const Text(
              '인기 검색',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Expanded(child: Container()),
            Text(
              '오늘 ${DateTime.now().formattedTime} 기준',
              style: const TextStyle(fontSize: 12),
            ),
          ]),
        ),
        //const Height(20),
        ...popularStocks
            .mapIndexed(
              (element, index) => PopualrStockItem(
                stock: element,
                number: index + 1,
              ),
            )
            .toList(),
      ],
    );
  }
}
