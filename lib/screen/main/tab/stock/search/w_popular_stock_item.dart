import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo/vo_popular_stock.dart';
import 'package:flutter/material.dart';

class PopualrStockItem extends StatelessWidget {
  final PopularStock stock;
  final int number;

  const PopualrStockItem({
    super.key,
    required this.stock,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              number.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: context.appColors.dimmedText,
              ),
            ),
          ),
          const Width(10),
          Text(
            stock.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: context.appColors.dimmedText,
            ),
          ),
          Expanded(child: Container()),
          Text(
            stock.todayPercentageString,
            style: TextStyle(
              color: stock.getTodayPercentageColor(context),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
