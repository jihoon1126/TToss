import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_text_field_with_delete.dart';
import 'package:flutter/material.dart';

class StockSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;

  const StockSearchAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: kToolbarHeight, // 시스템에서 권장하는 Appbar 높이로 설정
        child: Column(
          children: [
            Row(
              children: [
                // 뒤로가기
                Tap(
                  onTap: () {
                    Nav.pop(context);
                  },
                  child: const SizedBox(
                    width: 56,
                    height: kToolbarHeight - 1,
                    child: Arrow(
                      direction: AxisDirection.left,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextFieldWithDelete(
                      controller: controller,
                      texthint: '\'삼성\'을 검색해보세요.',
                      textInputAction: TextInputAction.search, // 키보드의 엔터를 검색으로 변경
                      onEditingComplete: () {
                        debugPrint('검색완료');
                        // 검색이 완료되면 키보드 가리기
                        AppKeyboardUtil.hide(context);
                      },
                    ),
                  ),
                ),
                const Width(20)
              ],
            ),
            const Line(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
