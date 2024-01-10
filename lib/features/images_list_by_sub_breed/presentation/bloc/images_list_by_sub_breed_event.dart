part of 'images_list_by_sub_breed_bloc.dart';

abstract class ImagesListBySubBreedEvent extends Equatable {}

class ImagesListBySubBreedInitialEvent extends ImagesListBySubBreedEvent {
  @override
  List<Object?> get props => [];
}

class ImagesListBySubBreedFetchEvent extends ImagesListBySubBreedEvent {
  final String selectedBreed;
  final String selectedSubBreed;

  ImagesListBySubBreedFetchEvent(
      {required this.selectedBreed, required this.selectedSubBreed});

  @override
  List<Object?> get props => [selectedSubBreed];
}
