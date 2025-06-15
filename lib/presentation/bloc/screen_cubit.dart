import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'screen_state.dart';

class ScreenCubit extends Cubit<ScreenState> {
  ScreenCubit() : super(ScreenInitial(screenIndex: 0));

  void updateScreen(
    int index, {
    int projectIndex = 0,
    bool? isScrollPositionMentioned,
  }) {
    return emit(
      ScreenUpdated(
        screenIndex: index,
        projectIndex: projectIndex,
        isScrollPositionMentioned: isScrollPositionMentioned,
      ),
    );
  }
}
