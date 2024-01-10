part of 'breeds_bloc.dart';

class BreedsState {}

class BreedsInitialState extends BreedsState {}

class BreedsLoadingState extends BreedsState {}

class BreedsLoadedState extends BreedsState {
  final List<BreedsModel> listBreeds;

  BreedsLoadedState({required this.listBreeds});
}

class BreedsErrorState extends BreedsState {
  final String error;

  BreedsErrorState({required this.error});
}
