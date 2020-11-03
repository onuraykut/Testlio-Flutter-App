import 'package:equatable/equatable.dart';
import 'package:eslesmeapp/model/cozenler.dart';
import 'package:eslesmeapp/model/user.dart';

abstract class SonucState extends Equatable {
  const SonucState();

  @override
  List<Object> get props => [];
}

class SonucUninitialized extends SonucState {

}
class InitialSonucState extends SonucState {}


class SonucError extends SonucState {}

class SonucLoading extends SonucState {}

class SonucLoaded extends SonucState {
  final List<Cozenler> cozenler;
  final bool hasReachedMax;

  const SonucLoaded({
    this.cozenler,
    this.hasReachedMax,
  });

  SonucLoaded copyWith({
    List<User> users,
    bool hasReachedMax,
  }) {
    return SonucLoaded(
      cozenler: cozenler ?? this.cozenler,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [cozenler, hasReachedMax];

  @override
  String toString() =>
      'TestLoaded { Tests: ${cozenler.length}, hasReachedMax: $hasReachedMax }';
}