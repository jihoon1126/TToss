import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/benefit/vo_benefit.dart';
import 'package:flutter/material.dart';

class BenefitItem extends StatelessWidget {
  final Benefit benefit;

  const BenefitItem({super.key, required this.benefit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Image.asset(
            benefit.imagePath,
            width: 50,
            height: 50,
          ),
          const Width(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                benefit.subTitle,
                style: TextStyle(
                  color: context.appColors.textBadgeText,
                  fontSize: 13,
                ),
              ),
              const Height(5),
              Text(
                benefit.title,
                style: TextStyle(
                  color: context.appColors.blueText,
                  fontSize: 13,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
