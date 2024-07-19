import 'package:fast_app_base/screen/main/tab/stock/vo/vo_popular_stock.dart';

class Stock extends PopualarStock {
  final String stockImagePath;

  Stock({
    required super.yesterdayClosePrice,
    required super.currentPrice,
    required super.name,
    required this.stockImagePath,
  });
}
