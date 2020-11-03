import 'package:equatable/equatable.dart';
import 'package:eslesmeapp/model/room.dart';


abstract class TestState extends Equatable {
  const TestState();

  @override
  List<Object> get props => [];
}

class TestUninitialized extends TestState {
  
}
class InitialTestState extends TestState {}


class TestError extends TestState {}

class TestLoading extends TestState {}

class TestLoaded extends TestState {
  final List<Room> rooms;
  final Room room;
  final bool hasReachedMax;

  const TestLoaded({
    this.rooms,
    this.room,
    this.hasReachedMax,
  });

  TestLoaded copyWith({
    List<Room> rooms,
    Room room,
    bool hasReachedMax,
  }) {
    return TestLoaded(
      rooms: rooms ?? this.rooms,
      room: room ?? this.room,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [rooms, room,hasReachedMax];

  @override
  String toString() =>
      'TestLoaded { rooms: ${rooms.length}, hasReachedMax: $hasReachedMax }';
}