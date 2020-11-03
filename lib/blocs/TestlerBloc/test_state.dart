import 'package:equatable/equatable.dart';
import 'package:eslesmeapp/model/test.dart';


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
  final List<Test> Tests;
  final Test test;
  final bool hasReachedMax;

  const TestLoaded({
    this.Tests,
    this.test,
    this.hasReachedMax,
  });

  TestLoaded copyWith({
    List<Test> Tests,
    Test test,
    bool hasReachedMax,
  }) {
    return TestLoaded(
      Tests: Tests ?? this.Tests,
      test: test ?? this.test,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [Tests, test,hasReachedMax];

  @override
  String toString() =>
      'TestLoaded { Tests: ${Tests.length}, hasReachedMax: $hasReachedMax }';
}