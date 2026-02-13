part of 'test_cubit.dart';

@immutable
sealed class TestState {}

final class TestInitial extends TestState {}

final class TestLoading extends TestState {}

final class TestFailure extends TestState {
  /// how customize your state
  final String message;

  TestFailure(this.message);
}

final class TestSuccess extends TestState {
  BmiResponse data;

  TestSuccess(this.data);
}
