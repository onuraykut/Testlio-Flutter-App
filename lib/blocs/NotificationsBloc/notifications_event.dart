import 'package:equatable/equatable.dart';

abstract class NotificationsEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class FetchNotificationEvent extends NotificationsEvent {
}
