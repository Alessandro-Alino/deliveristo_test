part of 'random_image_by_sub_breed_bloc.dart';

class RandomImageBySubBreedState {}

class RandomImageBySubBreedInitialState extends RandomImageBySubBreedState {}

class RandomImageBySubBreedLoadingState extends RandomImageBySubBreedState {}

class RandomImageBySubBreedLoadedState extends RandomImageBySubBreedState {
  final SingleBreedModel singleRandomImageByBreed;

  RandomImageBySubBreedLoadedState({required this.singleRandomImageByBreed});
}

class RandomImageBySubBreedErrorState extends RandomImageBySubBreedState {
  final String error;

  RandomImageBySubBreedErrorState({required this.error});
}
