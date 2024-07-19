import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app.dart';
import 'common/data/preference/app_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async {
  final bindings = WidgetsFlutterBinding.ensureInitialized();

  // 화면이 바인딩될 때까지 NativeSplash 표시
  // 비표시는 s_main.dart의 afterFirstLayout 함수
  FlutterNativeSplash.preserve(widgetsBinding: bindings);

  await EasyLocalization.ensureInitialized();
  await AppPreferences.init();

  timeago.setLocaleMessages('ko', timeago.KoMessages());

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ko')],
      fallbackLocale: const Locale('ko'),
      path: 'assets/translations',
      useOnlyLangCode: true,
      child: const App()));
}
