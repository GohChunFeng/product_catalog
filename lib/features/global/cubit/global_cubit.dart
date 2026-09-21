import 'package:flutter_bloc/flutter_bloc.dart';

import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalState());

  void showLoading() {
    emit(state.copyWith(isLoading: true));
  }

  void hideLoading() {
    emit(state.copyWith(isLoading: false));
  }
}
