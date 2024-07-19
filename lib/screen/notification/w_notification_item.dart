import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';

import 'vo/vo_ttoss_notification.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItemWidget extends StatefulWidget {
  final TtossNotification notification;
  final VoidCallback onTap;

  const NotificationItemWidget({super.key, required this.notification, required this.onTap});

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  static const leftPadding = 15.0;
  static const iconWidth = 25.0;

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: widget.notification.isRead ? AppColors.veryDarkGrey : context.appColors.unreadColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Width(leftPadding),
                Image.asset(
                  widget.notification.type.iconPath,
                  width: iconWidth,
                ),
                widget.notification.type.name.text.size(12).color(context.appColors.lessImportant).make(),
                Expanded(child: Container()),
                Text(
                  timeago.format(widget.notification.time, locale: context.locale.languageCode),
                  style: TextStyle(
                    fontSize: 13,
                    color: context.appColors.lessImportant,
                  ),
                ),
                width10,
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: leftPadding + iconWidth,
              ),
              child: Text(
                widget.notification.description,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
