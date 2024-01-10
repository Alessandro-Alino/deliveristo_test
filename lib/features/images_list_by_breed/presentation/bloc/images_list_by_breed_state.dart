part of 'images_list_by_breed_bloc.dart';

class ImagesListByBreedState {}

class ImagesListByBreedInitialState extends ImagesListByBreedState {}

class ImagesListByBreedLoadingState extends ImagesListByBreedState {}

class ImagesListByBreedLoadedState extends ImagesListByBreedState {
  final ListOfBreedModel listOfBreedModel;

  ImagesListByBreedLoadedState({required this.listOfBreedModel});
}

class ImagesListByBreedErrorState extends ImagesListByBreedState {
  final String error;

  ImagesListByBreedErrorState({required this.error});
}
