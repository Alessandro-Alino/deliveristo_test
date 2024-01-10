import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'internet_conn_event.dart';
part 'internet_conn_state.dart';

class InternetConnBloc extends Bloc<InternetConnEvent, InternetConnState> {
  StreamSubscription? subscription;

  InternetConnBloc() : super(InternetConnInitialState()) {
    on<OnInternetConnEvent>((event, emit) => emit(InternetConnSuccessState()));
    on<OnNotInternetConnEvent>(
        (event, emit) => emit(InternetConnFailureState()));

    subscription =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          // The internet is now connected
          add(OnInternetConnEvent());
          break;
        case InternetStatus.disconnected:
          // The internet is now disconnected
          add(OnNotInternetConnEvent());
          break;
      }
    });
  }

  /// Closes the BLoC and performs necessary cleanup.
  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
