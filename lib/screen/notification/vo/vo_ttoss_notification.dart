import 'notification_type.dart';

class TtossNotification {
  final NotificationType type;
  final String description;
  final DateTime time;
  bool isRead;

  TtossNotification({
    required this.type,
    required this.description,
    required this.time,
    this.isRead = false,
  });
}
