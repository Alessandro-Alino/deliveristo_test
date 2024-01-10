import 'package:deliveristo_test/features/images_list_by_breed/domain/model/list_of_breed_model.dart';
import 'package:deliveristo_test/features/images_list_by_breed/domain/use_cases/images_list_by_breed_use_cases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'images_list_by_breed_event.dart';
part 'images_list_by_breed_state.dart';

class ImagesListByBreedBloc
    extends Bloc<ImagesListByBreedEvent, ImagesListByBreedState> {
  final ListImagesByBreedUseCases useCase;

  ImagesListByBreedBloc({required this.useCase})
      : super(ImagesListByBreedInitialState()) {
    on<ImagesListByBreedInitialEvent>((event, emit) => (_reset(event, emit)));
    on<ImagesListByBreedFetchEvent>((event, emit) =>
        (_fetchListImagesByBreed(event, emit, event.selectedBreed)));
  }

  reset() => add(ImagesListByBreedInitialEvent());
  fetchListImagesByBreed(String selectedBreed) =>
      add(ImagesListByBreedFetchEvent(selectedBreed: selectedBreed));
  _reset(ImagesListByBreedEvent event, Emitter<ImagesListByBreedState> emit) {
    emit(ImagesListByBreedInitialState());
  }

  _fetchListImagesByBreed(ImagesListByBreedEvent event,
      Emitter<ImagesListByBreedState> emit, String selectedBreed) async {
    emit(ImagesListByBreedLoadingState());
    ListOfBreedModel listOfBreedModel;
    try {
      listOfBreedModel = await useCase.getListImageByBreed(selectedBreed);
      emit(ImagesListByBreedLoadedState(listOfBreedModel: listOfBreedModel));
    } catch (error) {
      emit(ImagesListByBreedErrorState(error: error.toString()));
    }
  }
}
