part of 'random_image_by_sub_breed_bloc.dart';

abstract class RandomImageBySubBreedEvent extends Equatable {}

class RandomImageBySubBreedInitialEvent extends RandomImageBySubBreedEvent {
  @override
  List<Object?> get props => [];
}

class RandomImageBySubBreedFetchEvent extends RandomImageBySubBreedEvent {
  final String selectedBreed;
  final String selectedSubBreed;

  RandomImageBySubBreedFetchEvent(
      {required this.selectedBreed, required this.selectedSubBreed});

  @override
  List<Object?> get props => [selectedBreed];
}
