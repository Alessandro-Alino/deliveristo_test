import 'package:deliveristo_test/features/random_image_by_breed/domain/model/single_breed_model.dart';
import 'package:deliveristo_test/features/random_image_by_sub_breed/domain/use_cases/random_image_by_sub_breed_use_cases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'random_image_by_sub_breed_event.dart';
part 'random_image_by_sub_breed_state.dart';

class RandomImageBySubBreedBloc
    extends Bloc<RandomImageBySubBreedEvent, RandomImageBySubBreedState> {
  final RandomSubBreedsUseCases useCases;
  RandomImageBySubBreedBloc({required this.useCases})
      : super(RandomImageBySubBreedInitialState()) {
    on<RandomImageBySubBreedInitialEvent>(
        (event, emit) => (_reset(event, emit)));

    on<RandomImageBySubBreedFetchEvent>((event, emit) =>
        (_fetchRandomImageBySubBreed(
            event, emit, event.selectedBreed, event.selectedSubBreed)));
  }

  reset() => add(RandomImageBySubBreedInitialEvent());
  fetchRandomImageBySubBreed(String selectedBreed, String selectedSubBreed) =>
      add(RandomImageBySubBreedFetchEvent(
          selectedBreed: selectedBreed, selectedSubBreed: selectedSubBreed));

  _reset(RandomImageBySubBreedEvent event,
      Emitter<RandomImageBySubBreedState> emit) {
    emit(RandomImageBySubBreedInitialState());
  }

  _fetchRandomImageBySubBreed(
      RandomImageBySubBreedEvent event,
      Emitter<RandomImageBySubBreedState> emit,
      String selectedBreed,
      String selectedSubBreed) async {
    emit(RandomImageBySubBreedLoadingState());
    SingleBreedModel singleRandomImageByBreed;
    try {
      singleRandomImageByBreed = await useCases.getRandomImageBySubBreed(
          selectedBreed, selectedSubBreed);
      debugPrint(singleRandomImageByBreed.toString());
      emit(RandomImageBySubBreedLoadedState(
          singleRandomImageByBreed: singleRandomImageByBreed));
    } catch (error) {
      emit(RandomImageBySubBreedErrorState(error: error.toString()));
    }
  }
}
