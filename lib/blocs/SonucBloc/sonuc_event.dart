import 'package:equatable/equatable.dart';

abstract class SonucEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchSonucEvent extends SonucEvent {
  String roomId;

  FetchSonucEvent(this.roomId);
}

