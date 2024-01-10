import 'package:deliveristo_test/features/list_all_breeds/domain/model/breeds_model/breeds_model.dart';
import 'package:deliveristo_test/features/list_all_breeds/domain/use_cases/breeds_use_cases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'breeds_event.dart';
part 'breeds_state.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> {
  final BreedsUseCases useCases;
  BreedsBloc({required this.useCases}) : super(BreedsInitialState()) {
    on<BreedsFetchEvent>((event, emit) => (_fetchBreedList(event, emit)));
  }

  fetchBreedList() => add(BreedsFetchEvent());

  _fetchBreedList(BreedsEvent event, Emitter<BreedsState> emit) async {
    emit(BreedsLoadingState());
    List<BreedsModel> listBreeds;

    bool result = await InternetConnection().hasInternetAccess;
    if (result) {
      try {
        listBreeds = await useCases.getListAllBreeds();
        emit(BreedsLoadedState(listBreeds: listBreeds));
      } catch (error) {
        emit(BreedsErrorState(error: error.toString()));
      }
    } else {
      emit(BreedsInitialState());
    }
  }
}
