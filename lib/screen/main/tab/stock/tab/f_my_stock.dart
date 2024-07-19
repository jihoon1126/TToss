import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_long_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/w_interest_stock_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyStockFragment extends StatelessWidget {
  const MyStockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 계좌 정보
        getMyAccount(context),
        // 간격 설정
        const Height(20),
        // 주식 정보
        getMyStock(context),
      ],
    );
  }

  // 계좌 정보 위젯
  Widget getMyAccount(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: context.appColors.roundedLayoutBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Height(20),
            const Text('계좌'),
            Row(
              children: [
                const Text(
                  '443원',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Arrow(),
                Expanded(
                  child: Container(),
                ),
                RoundedContainer(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  radius: 8,
                  backgroundColor: context.appColors.buttonBackground,
                  child: const Text(
                    '채우기',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
            const Height(30),
            Line(
              color: context.appColors.divider,
            ),
            const Height(10),
            LongButton(
              title: '주문내역',
              onTap: () {
                context.showSnackbar('주문내역');
              },
            ),
            LongButton(
              title: '판매수익',
              onTap: () {
                context.showSnackbar('판매수익');
              },
            ),
          ],
        ),
      );

  Widget getMyStock(BuildContext context) => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Column(
          children: [
            const Height(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '관심주식',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '편집하기',
                        style: TextStyle(color: context.appColors.lessImportant),
                      ),
                    ],
                  ),
                  const Height(20),
                  Tap(
                    onTap: () {
                      context.showSnackbar('기본');
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('기본'),
                          Arrow(
                            direction: AxisDirection.up,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const InterestStockList(),
          ],
        ),
      );
}
