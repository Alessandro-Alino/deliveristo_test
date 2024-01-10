part of 'random_image_by_breed_bloc.dart';

class RandomImageByBreedState {}

class RandomImageByBreedInitialState extends RandomImageByBreedState {}

class RandomImageByBreedLoadingState extends RandomImageByBreedState {}

class RandomImageByBreedLoadedState extends RandomImageByBreedState {
  final SingleBreedModel singleRandomImageByBreed;

  RandomImageByBreedLoadedState({required this.singleRandomImageByBreed});
}

class RandomImageByBreedErrorState extends RandomImageByBreedState {
  final String error;

  RandomImageByBreedErrorState({required this.error});
}
