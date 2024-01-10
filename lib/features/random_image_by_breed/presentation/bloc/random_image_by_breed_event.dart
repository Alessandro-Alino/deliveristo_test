part of 'random_image_by_breed_bloc.dart';

abstract class RandomImageByBreedEvent extends Equatable {}

class RandomImageByBreedInitialEvent extends RandomImageByBreedEvent {
  @override
  List<Object?> get props => [];
}

class RandomImageByBreedFetchEvent extends RandomImageByBreedEvent {
  final String selectedBreed;

  RandomImageByBreedFetchEvent({required this.selectedBreed});

  @override
  List<Object?> get props => [selectedBreed];
}
