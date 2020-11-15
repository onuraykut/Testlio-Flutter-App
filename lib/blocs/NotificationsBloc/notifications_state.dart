import 'package:equatable/equatable.dart';
import 'package:eslesmeapp/model/bildirim.dart';
abstract class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

class InitialNotificationsState extends NotificationsState {
  @override
  List<Object> get props => [];
  
  
}

class NotificationUninitialized extends NotificationsState {
}

class NotificationError extends NotificationsState {}

class NotificationLoading extends NotificationsState {}

class NotificationLoaded extends NotificationsState {
  final List<Bildirim> bildirim;

  const NotificationLoaded({
    this.bildirim,
  });

  NotificationLoaded copyWith({
    List<Bildirim> bildirim,
  }) {
    return NotificationLoaded(
      bildirim: bildirim ?? this.bildirim,
    );
  }

  @override
  List<Object> get props => [bildirim];

}
