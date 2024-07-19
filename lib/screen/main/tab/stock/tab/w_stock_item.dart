import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo/vo_stock.dart';
import 'package:flutter/material.dart';

class StockItem extends StatelessWidget {
  final Stock stock;

  const StockItem({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Width(15),
          // 이미지
          Image.asset(
            stock.stockImagePath,
            width: 35,
          ),
          const Width(20),
          // 주식명
          Text(
            stock.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: context.appColors.dimmedText,
            ),
          ),
          // 빈칸 채우기
          Expanded(
            child: Container(),
          ),
          // 주식 정보
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                stock.todayPercentageString,
                style: TextStyle(
                  color: stock.getTodayPercentageColor(context),
                  fontSize: 16,
                ),
              ),
              const Height(5),
              Text(
                stock.yesterdayClosePrice.toComma(),
                style: TextStyle(
                  color: context.appColors.dimmedText,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Width(20),
        ],
      ),
    );
  }
}
