import 'package:after_layout/after_layout.dart';
import 'package:fast_app_base/screen/main/tab/tab_item.dart';
import 'package:fast_app_base/screen/main/tab/tab_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../common/common.dart';
import 'w_menu_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin, AfterLayoutMixin {
  // 현재 탭 변수 - 최초 home
  TabItem _currentTab = TabItem.home;

  // List<TabItem> 변수 생성
  final tabs = [
    TabItem.home,
    TabItem.benefit,
    TabItem.ttosspay,
    TabItem.stock,
    TabItem.all,
  ];

  // List<GlobalKey<NavigatorState>> 변수 생성
  // initState()에서 함수 호출을 통해 탭을 반복하며 순차적으로 키를 생성
  final List<GlobalKey<NavigatorState>> navigatorKeys = [];

  // getter - 현재 탭의 index를 가져온다.
  int get _currentIndex => tabs.indexOf(_currentTab);

  // getter - 현재 탭의 navigationKey를 가져온다.
  GlobalKey<NavigatorState> get _currentTabNavigationKey => navigatorKeys[_currentIndex];

  bool get extendBody => true;

  static double get bottomNavigationBarBorderRadius => 30.0;

  static const double bottomNavigatorHeight = 50.0;

  @override
  void initState() {
    super.initState();

    // 각 탭의 tNavigatorKey 생성
    initNavigatorKeys();
  }

  // AfterLayoutMixin의 override
  // 화면 로딩이 완료되면 "FlutterNativeSplash.remove();" 을 호출하여 NativeSplash 이미지 비표시
  // [참고] 이미지 표시 부분은 main.dart의 FlutterNativeSplash.preserve(widgetsBinding: bindings);
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    // 테스트를 위해 1.5초 지연
    delay(
      () {
        // NativeSplash 제거
        FlutterNativeSplash.remove();
      },
      const Duration(
        milliseconds: 1500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // PopScope - 뒤로가기 제스처를 관리
    return PopScope(
      canPop: isRootPage, // ture : 화면 종료, false이면 비활성화
      onPopInvoked: _handleBackPressed,
      child: Scaffold(
        extendBody: extendBody, // bottomNavigationBar 아래 영역 까지 그림
        drawer: const MenuDrawer(),
        body: Container(
          color: context.appColors.seedColor.getMaterialColorValues[200],
          padding: EdgeInsets.only(bottom: extendBody ? 60 - bottomNavigationBarBorderRadius : 0),
          child: SafeArea(
            bottom: !extendBody,
            child: pages,
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  bool get isRootPage => _currentTab == TabItem.home && _currentTabNavigationKey.currentState?.canPop() == false;
  // body 페이지 바인딩
  // IndexedStack - 여러 자식 위젯 중 하나만 표시하고 나머지는 숨김
  IndexedStack get pages => IndexedStack(
      index: _currentIndex, // 표시할 인덱스
      // Offstage - 자식 위젯의 표시 여부를 제어.
      //  offstage
      //   - true:  자식을 숨김.
      //   - false : IndexedStack 때문에 화면에 표시되지는 않지만 내부적으로 모든 Navigator가 항상 활성화된 상태로 유지되기 때문에, 잠재적으로 더 많은 메모리와 리소스를 사용
      //             따라서 활성화 되지 않은 위젯은 true로 설정해야함
      children: tabs
          .mapIndexed((tab, index) => Offstage(
                offstage: _currentTab != tab,
                child: TabNavigator(
                  navigatorKey: navigatorKeys[index],
                  tabItem: tab,
                ),
              ))
          .toList());

  // 뒤로가기 실행

  void _handleBackPressed(bool didPop) {
    debugPrint('didPop :$didPop');

    if (!didPop) {
      // 루트 페이지는 네비게이터 스택에서 가장 아래에 있는 페이지로, navigationKey.currentState?.canPop()이 false를 반환하는 페이지
      // 따라서 루트 페이지가 아니라면 페이지를 pop
      if (_currentTabNavigationKey.currentState?.canPop() == true) {
        Nav.pop(_currentTabNavigationKey.currentContext!);
        // 아래와 동일
        //_currentTabNavigationKey.currentState!.pop();
        return;
      }

      // 루트 페이지일 경우 현재 탭이 [홈 탭]이 아니라면 [홈 탭]으로 변경
      if (_currentTab != TabItem.home) {
        _changeTab(tabs.indexOf(TabItem.home));
      }
    }
  }

  // BottomNavigationBar 구성
  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bottomNavigationBarBorderRadius),
          topRight: Radius.circular(bottomNavigationBarBorderRadius),
        ),
        child: BottomNavigationBar(
          items: navigationBarItems(context),
          currentIndex: _currentIndex,
          selectedItemColor: context.appColors.text,
          unselectedItemColor: context.appColors.iconButtonInactivate,
          onTap: _handleOnTapNavigationBarItem,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  // BottomNavigationBar Item 구성
  List<BottomNavigationBarItem> navigationBarItems(BuildContext context) {
    return tabs
        .mapIndexed(
          (tab, index) => tab.toNavigationBarItem(
            context,
            isActivated: _currentIndex == index,
          ),
        )
        .toList();
  }

  // 탭 변경
  void _changeTab(int index) {
    setState(() {
      // 현재 탭 변경
      _currentTab = tabs[index];
    });
  }

  // BottomNavigationBar Item onTap
  void _handleOnTapNavigationBarItem(int index) {
    final oldTab = _currentTab;
    final targetTab = tabs[index];

    // 현재 탭과 동일한 탭이면 모든 페이지를 pop (초기화 효과)
    if (oldTab == targetTab) {
      final navigationKey = _currentTabNavigationKey;
      popAllHistory(navigationKey);
    }

    // 탭 변경
    _changeTab(index);
  }

  void popAllHistory(GlobalKey<NavigatorState> navigationKey) {
    // navigationKey.currentState?.canPop() == true는 네비게이터의 현재 상태에서 더 많은 항목을 팝할 수 있는지 여부를 확인
    // canPop이 true이면 네비게이터에 최소한 하나의 화면이 남아 있다는 의미입니다.
    final bool canPop = navigationKey.currentState?.canPop() == true;
    if (canPop) {
      // 네비게이터는 스택 구조라 처음 탭 진입시 루트페이지가 스택에 쌓임
      // 그 다음 다른 페이지가 스택에 쌓이는 구조
      // 같은 탭을 누르게 되면 루트페이지가 나올 때까지 쌓인 스택들을 pop해준다
      // 루트 페이지는 네비게이터 스택에서 가장 아래에 있는 페이지로, navigationKey.currentState?.canPop()이 false를 반환하는 페이지
      // 이는 루트 페이지를 더 이상 팝할 수 없음을 의미
      while (navigationKey.currentState?.canPop() == true) {
        navigationKey.currentState!.pop();
      }
    }
  }

  // 초기화 때 각 탭의 인덱스에 맞게 GlobalKey<NavigatorState>()를 생성해줌
  // 추후 탭을 반복하면서 Navigator 위젯을 생성
  void initNavigatorKeys() {
    for (final _ in tabs) {
      navigatorKeys.add(GlobalKey<NavigatorState>());
    }
  }
}
