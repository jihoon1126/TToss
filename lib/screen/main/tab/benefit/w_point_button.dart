import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/material.dart';

class PointButton extends StatelessWidget {
  final int point;

  const PointButton({super.key, required this.point});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '내 포인트',
          style: TextStyle(
            color: context.appColors.lessImportant,
          ),
        ),
        Expanded(child: Container()),
        Text(
          '$point 원',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: context.appColors.textBadgeText,
          ),
        ),
        const Width(10),
        Arrow(
          color: context.appColors.lessImportant,
        ),
      ],
    );
  }
}
