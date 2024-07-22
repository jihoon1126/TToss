import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_search_stock_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_search_auto_complete_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_search_history_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_stock_search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchStockScreen extends StatefulWidget {
  const SearchStockScreen({super.key});

  @override
  State<SearchStockScreen> createState() => _SearchStockScreenState();
}

class _SearchStockScreenState extends State<SearchStockScreen> with SearchStockDataProvider {
  // TextField 컨트롤러
  final TextEditingController _controller = TextEditingController();
  // SearchStockData GetXController 탐색
  /*
    initState()에서 Get.put(SearchStockData());를 실행하므로 현재 단계에서 find를 할 수 없음. 따라서 late키워드 추가
    SearchStockDataProvider mixin으로 이동 (주석차리)    
  */
  //late final searchData = Get.find<SearchStockData>();

  @override
  void initState() {
    // SearchStockData GetXController 등록
    Get.put(SearchStockData());

    // TextField에 단어가 입력될 경우 자동완성 검색
    _controller.addListener(() {
      //debugPrint(_controller.text);
      searchData.search(_controller.text);
    });

    super.initState();
  }

  @override
  void dispose() {
    // 화면을 벗어날 경우 SearchStockData GetXController 삭제
    //Get.delete<SearchStockData>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StockSearchAppBar(
        controller: _controller,
      ),
      body: Obx(
        // setState 대신 Obx를 통해 변경사항 반영
        () => searchData.autoCompleteList.isEmpty
            ? ListView(
                children: const [
                  SearchHistoryList(),
                  PopularSearchStockList(),
                ],
              )
            : SearchAotoCompleteList(
                controller: _controller,
              ),
      ),
    );
  }
}
