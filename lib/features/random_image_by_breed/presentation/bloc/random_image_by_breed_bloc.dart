import 'package:deliveristo_test/features/random_image_by_breed/domain/model/single_breed_model.dart';
import 'package:deliveristo_test/features/random_image_by_breed/domain/use_cases/random_image_by_breed_use_cases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'random_image_by_breed_event.dart';
part 'random_image_by_breed_state.dart';

class RandomImageByBreedBloc
    extends Bloc<RandomImageByBreedEvent, RandomImageByBreedState> {
  final RandomBreedsUseCases useCases;
  RandomImageByBreedBloc({required this.useCases})
      : super(RandomImageByBreedInitialState()) {
    on<RandomImageByBreedInitialEvent>((event, emit) => (_reset(event, emit)));

    on<RandomImageByBreedFetchEvent>((event, emit) =>
        (_fetchRandomImageByBreed(event, emit, event.selectedBreed)));
  }

  reset() => add(RandomImageByBreedInitialEvent());
  fetchRandomImageByBreed(String selectedBreed) =>
      add(RandomImageByBreedFetchEvent(selectedBreed: selectedBreed));

  _reset(RandomImageByBreedEvent event, Emitter<RandomImageByBreedState> emit) {
    emit(RandomImageByBreedInitialState());
  }

  _fetchRandomImageByBreed(RandomImageByBreedEvent event,
      Emitter<RandomImageByBreedState> emit, String selectedBreed) async {
    emit(RandomImageByBreedLoadingState());
    SingleBreedModel singleRandomImageByBreed;
    try {
      singleRandomImageByBreed =
          await useCases.getRandomImageByBreed(selectedBreed);
      emit(RandomImageByBreedLoadedState(
          singleRandomImageByBreed: singleRandomImageByBreed));
    } catch (error) {
      emit(RandomImageByBreedErrorState(error: error.toString()));
    }
  }
}
