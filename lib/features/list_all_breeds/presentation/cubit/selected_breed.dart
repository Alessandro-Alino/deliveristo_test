import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedBreed extends Cubit<String?> {
  SelectedBreed() : super(null);

  selectBreedRandomImage(String? breed) => emit(breed);
}

class SelectedBreedForImageList extends Cubit<String?> {
  SelectedBreedForImageList() : super(null);

  selectBreedForImageList(String? breed) => emit(breed);
}
