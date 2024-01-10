part of 'images_list_by_breed_bloc.dart';

abstract class ImagesListByBreedEvent extends Equatable {}

class ImagesListByBreedInitialEvent extends ImagesListByBreedEvent {
  @override
  List<Object?> get props => [];
}

class ImagesListByBreedFetchEvent extends ImagesListByBreedEvent {
  final String selectedBreed;

  ImagesListByBreedFetchEvent({required this.selectedBreed});

  @override
  List<Object?> get props => [selectedBreed];
}
