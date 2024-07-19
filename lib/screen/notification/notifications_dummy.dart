import 'package:velocity_x/velocity_x.dart';
import 'vo/notification_type.dart';
import 'vo/vo_ttoss_notification.dart';

final notificationDummies = <TtossNotification>[
  TtossNotification(
    type: NotificationType.tossPay,
    description: '이번주에 영화 한편 어때요? CGV 할인 쿠폰이 도착했어요',
    time: DateTime.now().subtract(27.minutes),
  ),
  TtossNotification(
    type: NotificationType.stock,
    description: '인적분할에 대해 알려드릴게요.',
    time: DateTime.now().subtract(1.hours),
  ),
  TtossNotification(
    type: NotificationType.walk,
    description: '1000걸음 이상 걸었다면 포인트 받으세요.',
    time: DateTime.now().subtract(1.hours),
    isRead: true,
  ),
  TtossNotification(
    type: NotificationType.moneyTip,
    description: '유럽 식품 물가가 치솟고 있어요.\n남반석님, 유럽여행에 관심이 있다면 확인해보세요.',
    time: DateTime.now().subtract(8.hours),
    isRead: true,
  ),
  TtossNotification(
    type: NotificationType.walk,
    description: '오늘 1000걸음을 넘겼어요. 포인트를 받아보세요.',
    time: DateTime.now().subtract(11.hours),
  ),
  TtossNotification(
    type: NotificationType.luck,
    description: '6월 5일, 행운 복권이 도착했어요.',
    time: DateTime.now().subtract(12.hours),
  ),
  TtossNotification(
    type: NotificationType.people,
    description: '띵동! 월요일 공동구매 보러가기',
    time: DateTime.now().subtract(1.days),
  ),
];
