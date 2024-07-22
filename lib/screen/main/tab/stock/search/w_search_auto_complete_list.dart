import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_stock_detail.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:flutter/material.dart';

class SearchAotoCompleteList extends StatelessWidget with SearchStockDataProvider {
  final TextEditingController controller;

  // mixin을 참조하고 있으므로 생성자가 const가 되어서는 안됨
  SearchAotoCompleteList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchData.autoCompleteList.length,
      itemBuilder: (context, index) {
        final stock = searchData.autoCompleteList[index];
        final stockName = stock.name;

        return Tap(
          onTap: () {
            // 상세화면으로 이동
            Nav.push(StockDetailScreen(stockName: stockName));

            // 검색 히스토리에 추가
            searchData.addHistory(stock);

            // TextField 초기화
            controller.clear();
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(stockName),
          ),
        );
      },
    );
  }
}
