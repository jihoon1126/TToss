import 'package:fast_app_base/common/util/local_json.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo/vo_simple_stock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract mixin class SearchStockDataProvider {
  late final searchData = Get.find<SearchStockData>();
}

class SearchStockData extends GetxController {
  List<SimpleStock> stocks = [];
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> autoCompleteList = <SimpleStock>[].obs;

  @override
  void onInit() {
    //searchHistoryList.addAll(['삼성전자', 'LG전자', '현대자동차', '넷플리스']);
    loadLocalStockJoin();

    super.onInit();
  }

  // 주식 리스트 설정
  Future<void> loadLocalStockJoin() async {
    debugPrint('>>> loadLocalStockJoin');
    final jsonList = await LocalJson.getObjectList<SimpleStock>('json/stock_list.json');
    stocks.addAll(jsonList);
  }

  // 자동완성 검색
  void search(String keyword) {
    if (keyword.isEmpty) {
      autoCompleteList.clear();
      return;
    }
    autoCompleteList.value = stocks.where((element) => element.name.contains(keyword)).toList();

    //debugPrint(autoCompleteList.length.toString());
  }

  // 검색 히스토리 추가
  void addHistory(SimpleStock stock) {
    searchHistoryList.add(stock.name);
  }

  // 검색 히스토리 제거
  void removeHistory(String stockName) {
    searchHistoryList.remove(stockName);
  }
}
