import 'package:fast_app_base/screen/main/tab/tab_item.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator({
    super.key,
    required this.tabItem,
    required this.navigatorKey,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        onGenerateRoute: (routeSettings) {
          // IndexedStack의 index가 0일 경우
          // 첫 번째 Navigator 위젯은 onGenerateRoute 콜백을 호출하여 첫 번째 페이지(tabItem.firstPage)를 라우트로 생성
          // 따라서 첫 번째 탭의 첫 번째 페이지가 화면에 표시
          return MaterialPageRoute(
            builder: (context) => tabItem.firstPage,
          );
        });
  }
}
