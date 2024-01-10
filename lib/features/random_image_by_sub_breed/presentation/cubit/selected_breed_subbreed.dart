import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedBreedForSubBreed extends Cubit<String?> {
  SelectedBreedForSubBreed() : super(null);

  selectBreedForSubBreed(String? breed) => emit(breed);
}

class SelectedSubBreedForSubBreed extends Cubit<String?> {
  SelectedSubBreedForSubBreed() : super(null);

  selectSubBreedForSubBreed(String? breed) => emit(breed);
}
