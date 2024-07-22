import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_stock_detail.dart';
import 'package:flutter/material.dart';

class SearchHistoryItem extends StatelessWidget {
  final void Function() onTapDelete;
  final String stockName;

  const SearchHistoryItem({
    Key? key,
    required this.onTapDelete,
    required this.stockName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Height(10),
        RoundedContainer(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Tap(
                    onTap: () {
                      Nav.push(StockDetailScreen(stockName: stockName));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(stockName, maxLines: 1),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Tap(
                      onTap: onTapDelete,
                      child: const Icon(
                        Icons.close,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
