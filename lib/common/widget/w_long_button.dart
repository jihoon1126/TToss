import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const LongButton({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: onTap ?? () => {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Text(title),
            Expanded(
              child: Container(),
            ),
            Arrow(
              color: context.appColors.lessImportant,
            )
          ],
        ),
      ),
    );
  }
}