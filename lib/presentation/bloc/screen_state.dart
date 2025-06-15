part of 'screen_cubit.dart';

@immutable
abstract class ScreenState {}

class ScreenInitial extends ScreenState {
  final int screenIndex;

  ScreenInitial({required this.screenIndex});
}

class ScreenUpdated extends ScreenState {
  final int screenIndex;
  final int projectIndex;
  final bool? isScrollPositionMentioned;

  ScreenUpdated({
    required this.screenIndex,
    this.projectIndex = 0,
    this.isScrollPositionMentioned,
  });
}
