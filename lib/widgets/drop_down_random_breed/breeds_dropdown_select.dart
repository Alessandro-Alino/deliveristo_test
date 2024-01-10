import 'package:deliveristo_test/core/cubit/internet_cubit.dart';
import 'package:deliveristo_test/core/cubit/my_snackbar.dart';
import 'package:deliveristo_test/features/list_all_breeds/presentation/bloc/breeds_bloc.dart';
import 'package:deliveristo_test/widgets/drop_down_random_breed/dropdown_random_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedsDropDownSelect extends StatelessWidget {
  const BreedsDropDownSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Center(
        child: Container(
          width: 400.0,
          height: 70.0,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: BlocBuilder<BreedsBloc, BreedsState>(
                builder: (context, state) {
                  if (state is BreedsInitialState) {
                    return ActionChip(
                      key: const Key('downloadBreedList'),
                      label: const Text('Iniziamo'),
                      onPressed: () {
                        if (context.read<InternetCubit>().state == false) {
                          context.read<MySnackBarCubit>().mySnackBar(
                              context,
                              const Text('Check Internet connection',
                                  style: TextStyle(color: Colors.black)),
                              Colors.amber);
                        } else {
                          context.read<BreedsBloc>().fetchBreedList();
                        }
                      },
                    );
                  } else if (state is BreedsLoadingState) {
                    return const CircularProgressIndicator.adaptive();
                  } else if (state is BreedsLoadedState) {
                    return DropDownRandomBreed(breedsList: state.listBreeds);
                  } else if (state is BreedsErrorState) {
                    return Text('Errore: ${state.error}');
                  }
                  return const Text('What');
                },
              )),
            ),
          ),
        ),
      ),
    );
  }
}
