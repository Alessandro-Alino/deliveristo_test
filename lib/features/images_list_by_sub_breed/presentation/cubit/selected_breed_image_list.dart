import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedBreedForListSubBreed extends Cubit<String?> {
  SelectedBreedForListSubBreed() : super(null);

  selectBreedForListSubBreed(String? breed) => emit(breed);
}

class SelectedSubBreedForListSubBreed extends Cubit<String?> {
  SelectedSubBreedForListSubBreed() : super(null);

  selectSubBreedForListSubBreed(String? breed) => emit(breed);
}
