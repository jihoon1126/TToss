import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/data/preference/prefs.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/d_number_dialog.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_switch_menu.dart';
import 'package:fast_app_base/screen/opensource/s_opensource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  /* RxPrefs로 변경
  bool isPushOn = false;

  @override
  void initState() {
    isPushOn = Prefs.isPushOn.get();

    super.initState();
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // switch
            /* RxPrefs로 변경
            SwitchMenu(
              title: '푸시 설정',
              value: isPushOn,
              onChanged: (isOn) {
                Prefs.isPushOn(isOn);
                setState(() {
                  isPushOn = isOn;
                });
              },
            ),
            */
            Obx(
              () => SwitchMenu(
                title: '푸시 설정',
                value: Prefs.isPushOnRx.get(),
                onChanged: (isOn) {
                  Prefs.isPushOnRx(isOn);
                },
              ),
            ),
            // slider
            Obx(
              () => CupertinoSlider(
                value: Prefs.silderPosition.get(),
                onChanged: (value) {
                  Prefs.silderPosition(value);
                },
              ),
            ),
            // datetime
            Obx(
              () => BigButton(
                  text: '날짜 ${Prefs.birthday.get() == null ? '' : Prefs.birthday.get()?.formattedDate}',
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(const Duration(days: 90)),
                      lastDate: DateTime.now().add(const Duration(days: 90)),
                    );
                    if (date != null) {
                      Prefs.birthday.set(date);
                    }
                  }),
            ),
            // number
            Obx(
              () => BigButton(
                  text: '저장된 숫자 ${Prefs.number.get()}',
                  onTap: () async {
                    final number = await NumberDialog().show();
                    if (number != null) {
                      Prefs.number.set(number);
                    }
                  }),
            ),
            BigButton(
                text: '오픈소스 화면',
                onTap: () {
                  Nav.push(const OpensourceScreen());
                }),
          ],
        ),
      ),
    );
  }
}
