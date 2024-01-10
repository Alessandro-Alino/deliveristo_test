import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<bool> {
  InternetCubit() : super(false);

  connection(bool value) => emit(value);
}
