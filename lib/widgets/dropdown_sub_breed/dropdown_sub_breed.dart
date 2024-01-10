import 'package:deliveristo_test/core/cubit/internet_cubit.dart';
import 'package:deliveristo_test/core/cubit/my_snackbar.dart';
import 'package:deliveristo_test/features/list_all_breeds/domain/model/breeds_model/breeds_model.dart';
import 'package:deliveristo_test/features/list_all_breeds/presentation/bloc/breeds_bloc.dart';
import 'package:deliveristo_test/features/random_image_by_sub_breed/presentation/cubit/selected_breed_subbreed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubBreedsDropDownSelect extends StatelessWidget {
  const SubBreedsDropDownSelect({super.key});

  @override
  Widget build(BuildContext context) {
    //From List of Breeds and SubBreeds, Create a TreeList of DropDownMenuItem
    getDropdownMenuItems(List<BreedsModel> breedsList) {
      List<DropdownMenuItem> dropDownList = [];
      for (BreedsModel breedsModel in breedsList) {
        if (breedsModel.listSubBreeds.isEmpty) {
          null;
        } else {
          null;
          for (String subBreed in breedsModel.listSubBreeds) {
            dropDownList.add(
              DropdownMenuItem(
                  value: subBreed.toLowerCase(),
                  child: Text(
                      ' ${breedsModel.breedName.replaceFirst(breedsModel.breedName[0], breedsModel.breedName[0].toUpperCase())} - ${subBreed.replaceFirst(subBreed[0], subBreed[0].toUpperCase())}')),
            );
          }
        }
      }
      return dropDownList;
    }

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
                    return BlocBuilder<SelectedSubBreedForSubBreed, String?>(
                      builder: (context, stateSelected) {
                        return GestureDetector(
                          onTap: () {
                            if (context
                                    .read<SelectedBreedForSubBreed>()
                                    .state ==
                                null) {
                              context.read<MySnackBarCubit>().mySnackBar(
                                  context,
                                  const Text(
                                    'Select a Breed before!',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Colors.amber);
                            }
                          },
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor:
                                  const Color.fromARGB(255, 245, 229, 224),
                            ),
                            child: DropdownButton(
                              underline: const SizedBox(),
                              menuMaxHeight: 500.0,
                              borderRadius: BorderRadius.circular(10),
                              items: getDropdownMenuItems(state.listBreeds
                                  .where((element) =>
                                      element.breedName ==
                                      context
                                          .watch<SelectedBreedForSubBreed>()
                                          .state)
                                  .toList()),
                              isExpanded: true,
                              hint: const Text('Select Sub Breed'),
                              value: context
                                  .read<SelectedSubBreedForSubBreed>()
                                  .state,
                              onChanged: (value) {
                                context
                                    .read<SelectedSubBreedForSubBreed>()
                                    .selectSubBreedForSubBreed(value);
                              },
                            ),
                          ),
                        );
                      },
                    );
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
