import 'package:fast_app_base/common/data/preference/app_preferences.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_search_history_item.dart';
import 'package:flutter/material.dart';

class SearchHistoryList extends StatefulWidget {
  const SearchHistoryList({super.key});

  @override
  State<SearchHistoryList> createState() => _SearchHistoryListState();
}

class _SearchHistoryListState extends State<SearchHistoryList> with SearchStockDataProvider {
  /*
    SearchStockDataProvider mixin으로 이동 (주석차리)    
  */
  //late final searchData = Get.find<SearchStockData>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Obx(
        // setState 대신 Obx를 통해 변경사항 반영 (삭제 시)
        () => ListView.builder(
          scrollDirection: Axis.horizontal, // 가로방향 스크롤
          itemCount: searchData.searchHistoryList.length,
          itemBuilder: (context, index) {
            final stockName = searchData.searchHistoryList[index];

            return SearchHistoryItem(
              onTapDelete: () {
                // 히스토리 제거
                searchData.removeHistory(stockName);
              },
              stockName: stockName,
            );
          },
        ),
      ),
    );
  }
}
