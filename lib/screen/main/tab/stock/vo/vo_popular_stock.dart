import 'package:fast_app_base/screen/main/tab/stock/vo/stock_percentage_data_provider.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo/vo_simple_stock.dart';

class PopualarStock extends SimpleStock with StockPercentageDataProvider {
  @override
  final int currentPrice;
  @override
  final int yesterdayClosePrice;

  PopualarStock({
    required this.yesterdayClosePrice,
    required this.currentPrice,
    required String name,
  }) : super(name);
}
