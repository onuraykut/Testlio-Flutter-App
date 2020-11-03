import 'package:equatable/equatable.dart';

abstract class TestTekEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllEvent extends TestTekEvent {}

class FetchGizlediklerimEvent extends TestTekEvent {}

class FetchTestFromIdEvent extends TestTekEvent {
  String testId;

  FetchTestFromIdEvent(this.testId);
}

class FetchSharedWithMeEvent extends TestTekEvent {}
