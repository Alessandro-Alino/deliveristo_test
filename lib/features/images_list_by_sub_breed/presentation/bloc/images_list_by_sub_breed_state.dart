part of 'images_list_by_sub_breed_bloc.dart';

class ImagesListBySubBreedState {}

class ImagesListBySubBreedInitialState extends ImagesListBySubBreedState {}

class ImagesListBySubBreedLoadingState extends ImagesListBySubBreedState {}

class ImagesListBySubBreedLoadedState extends ImagesListBySubBreedState {
  final ListOfBreedModel listOfSubBreedModel;

  ImagesListBySubBreedLoadedState({required this.listOfSubBreedModel});
}

class ImagesListBySubBreedErrorState extends ImagesListBySubBreedState {
  final String error;

  ImagesListBySubBreedErrorState({required this.error});
}
