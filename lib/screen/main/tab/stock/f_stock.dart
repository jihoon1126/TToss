import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_image_button.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_search_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_my_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_todays_discovery.dart';
import 'package:flutter/material.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment> with SingleTickerProviderStateMixin {
  // _StockFragmentState 생성 과정에서 _tabController가 초기화되므로 vsync: this에서 this를 참조할 수 없음
  // 따라서 late키워드를 붙여 _tabController가 호출 될 때 참조하도록 수정
  // 또는 @initState에서 설정
  /*
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }
  */
  // 탭 컨트롤러
  late final _tabController = TabController(length: 2, vsync: this);
  // 현재 탭의 인덱스
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: context.appColors.roundedLayoutBackground,
          pinned: true,
          // 스크롤을 올릴 때 앱바의 배경색이 변경되는걸 방지하기 위해 추가
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: context.appColors.roundedLayoutBackground, // 배경색을 고정
            ),
          ),
          // drawer가 구현되어 있으면 햄버거 버튼이 표시됨
          // 없애기 위해선 leading부분의 초기화 필요 (아래 코드 추가 시 햄버거 버튼 비표시)
          //leading: Container(),
          actions: [
            ImageButton(
              imagePath: '$basePath/icon/stock_search.png',
              onTap: () {
                Nav.push(const SearchStockScreen());
                //context.showSnackbar('검색');
              },
            ),
            ImageButton(
              imagePath: '$basePath/icon/stock_calendar.png',
              onTap: () {
                context.showSnackbar('캘린더');
              },
            ),
            ImageButton(
              imagePath: '$basePath/icon/stock_settings.png',
              onTap: () {
                context.showSnackbar('세팅');
              },
            ),
          ],
        ),
        // 하단의 여벽을 주기 위해 SliverPadding 사용
        SliverPadding(
          padding: const EdgeInsets.only(
            bottom: MainScreenState.bottomNavigatorHeight,
          ),
          // Sliver에 위젯을 추가하기 위해선 SliverToBoxAdapter 필요
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                title,
                tabBar,
                // 각 탭별 Fragment 표시
                if (currentIndex == 0) const MyStockFragment() else const TodaysDiscoveryFragment(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 타이틀 위젯
  Widget get title => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            // 세로 정렬
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: [
              const Text(
                '토스증권',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Width(20),
              Text(
                'S&P 500',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: context.appColors.lessImportant,
                ),
              ),
              const Width(10),
              Text(
                3919.29.toComma(),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: context.appColors.plus,
                ),
              ),
            ],
          ),
        ),
      );

  // 탭 위젯
  Widget get tabBar => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              labelPadding: const EdgeInsets.symmetric(vertical: 20),
              indicatorColor: Colors.white,
              //indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
              controller: _tabController,
              tabs: const [
                Text('내 주식'),
                Text('오늘의 발견'),
              ],
            ),
            //const Line(),
          ],
        ),
      );
}
