import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeDataBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeDataBloc() : super(ThemeLightState());
}
