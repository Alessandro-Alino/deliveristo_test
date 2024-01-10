import 'package:deliveristo_test/features/images_list_by_breed/domain/model/list_of_breed_model.dart';
import 'package:deliveristo_test/features/images_list_by_sub_breed/domain/use_cases/images_list_by_breed_use_cases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'images_list_by_sub_breed_event.dart';
part 'images_list_by_sub_breed_state.dart';

class ImagesListBySubBreedBloc
    extends Bloc<ImagesListBySubBreedEvent, ImagesListBySubBreedState> {
  final ListImagesBySubBreedUseCases useCase;

  ImagesListBySubBreedBloc({required this.useCase})
      : super(ImagesListBySubBreedInitialState()) {
    on<ImagesListBySubBreedInitialEvent>(
        (event, emit) => (_reset(event, emit)));
    on<ImagesListBySubBreedFetchEvent>((event, emit) =>
        (_fetchListImagesBySubBreed(
            event, emit, event.selectedBreed, event.selectedSubBreed)));
  }

  reset() => add(ImagesListBySubBreedInitialEvent());
  fetchListImagesBySubBreed(String selectedBreed, String selectedSubBreed) =>
      add(ImagesListBySubBreedFetchEvent(
          selectedBreed: selectedBreed, selectedSubBreed: selectedSubBreed));
  _reset(ImagesListBySubBreedEvent event,
      Emitter<ImagesListBySubBreedState> emit) {
    emit(ImagesListBySubBreedInitialState());
  }

  _fetchListImagesBySubBreed(
      ImagesListBySubBreedEvent event,
      Emitter<ImagesListBySubBreedState> emit,
      String selectedBreed,
      String selectedSubBreed) async {
    emit(ImagesListBySubBreedLoadingState());
    ListOfBreedModel listOfSubBreedModel;
    try {
      listOfSubBreedModel =
          await useCase.getListImageBySubBreed(selectedBreed, selectedSubBreed);
      emit(ImagesListBySubBreedLoadedState(
          listOfSubBreedModel: listOfSubBreedModel));
    } catch (error) {
      emit(ImagesListBySubBreedErrorState(error: error.toString()));
    }
  }
}
