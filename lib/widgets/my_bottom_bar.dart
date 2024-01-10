import 'package:deliveristo_test/core/cubit/internet_cubit.dart';
import 'package:deliveristo_test/core/cubit/my_snackbar.dart';
import 'package:deliveristo_test/core/cubit/pageview_cubit.dart';
import 'package:deliveristo_test/features/images_list_by_breed/presentation/bloc/images_list_by_breed_bloc.dart';
import 'package:deliveristo_test/features/images_list_by_sub_breed/presentation/bloc/images_list_by_sub_breed_bloc.dart';
import 'package:deliveristo_test/features/images_list_by_sub_breed/presentation/cubit/selected_breed_image_list.dart';
import 'package:deliveristo_test/features/list_all_breeds/presentation/cubit/selected_breed.dart';
import 'package:deliveristo_test/features/random_image_by_breed/presentation/bloc/random_image_by_breed_bloc.dart';
import 'package:deliveristo_test/features/random_image_by_sub_breed/presentation/bloc/random_image_by_sub_breed_bloc.dart';
import 'package:deliveristo_test/features/random_image_by_sub_breed/presentation/cubit/selected_breed_subbreed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      child: Center(
        child: SizedBox(
          width: 500.0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Arrow Back PageView
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Center(
                    child: context.watch<PageViewCubit>().state == 0
                        ? const SizedBox(width: 30.0)
                        : IconButton(
                            onPressed: () {
                              pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                            ),
                          ),
                  ),
                ),
              ),
              if (context.watch<PageViewCubit>().state == 0)
                Flexible(
                  child: ActionChip(
                    key: const Key('Random Button'),
                    elevation: 5.0,
                    visualDensity: VisualDensity.standard,
                    avatar: const Icon(Icons.pets, size: 17.0),
                    label: const Text('Random'),
                    onPressed: () {
                      if (context.read<SelectedBreed>().state == null) {
                        context.read<MySnackBarCubit>().mySnackBar(
                            context,
                            const Text('Select One Breed!',
                                style: TextStyle(color: Colors.black)),
                            Colors.amber);
                      } else if (context.read<RandomImageByBreedBloc>().state
                          is RandomImageByBreedLoadingState) {
                        return;
                      } else if (context.read<InternetCubit>().state == false) {
                        context.read<MySnackBarCubit>().mySnackBar(
                            context,
                            const Text('Check Internet connection',
                                style: TextStyle(color: Colors.black)),
                            Colors.amber);
                      } else {
                        context
                            .read<RandomImageByBreedBloc>()
                            .fetchRandomImageByBreed(
                                context.read<SelectedBreed>().state.toString());
                      }
                    },
                  ),
                ),
              if (context.watch<PageViewCubit>().state == 1)
                Flexible(
                  child: ActionChip(
                    elevation: 5.0,
                    visualDensity: VisualDensity.standard,
                    avatar: const Icon(Icons.pets, size: 17.0),
                    label: const Text('List of Images'),
                    onPressed: () {
                      if (context.read<SelectedBreedForImageList>().state ==
                          null) {
                        context.read<MySnackBarCubit>().mySnackBar(
                            context,
                            const Text('Select One Breed!',
                                style: TextStyle(color: Colors.black)),
                            Colors.amber);
                      } else if (context.read<ImagesListByBreedBloc>().state
                          is ImagesListByBreedLoadingState) {
                        return;
                      } else if (context.read<InternetCubit>().state == false) {
                        context.read<MySnackBarCubit>().mySnackBar(
                            context,
                            const Text('Check Internet connection',
                                style: TextStyle(color: Colors.black)),
                            Colors.amber);
                      } else {
                        context
                            .read<ImagesListByBreedBloc>()
                            .fetchListImagesByBreed(context
                                .read<SelectedBreedForImageList>()
                                .state
                                .toString());
                      }
                    },
                  ),
                ),
              if (context.watch<PageViewCubit>().state == 2)
                Flexible(
                  child: ActionChip(
                    elevation: 5.0,
                    visualDensity: VisualDensity.standard,
                    avatar: const Icon(Icons.pets, size: 17.0),
                    label: const Text('Random by Sub-Breeds'),
                    onPressed: () {
                      if (context.read<SelectedBreedForSubBreed>().state ==
                              null ||
                          context.read<SelectedSubBreedForSubBreed>().state ==
                              null) {
                        context.read<MySnackBarCubit>().mySnackBar(
                            context,
                            const Text('Select One Breed, and one Sub Breed!',
                                style: TextStyle(color: Colors.black)),
                            Colors.amber);
                      } else if (context.read<RandomImageBySubBreedBloc>().state
                          is RandomImageBySubBreedLoadingState) {
                        return;
                      } else if (context.read<InternetCubit>().state == false) {
                        context.read<MySnackBarCubit>().mySnackBar(
                            context,
                            const Text('Check Internet connection',
                                style: TextStyle(color: Colors.black)),
                            Colors.amber);
                      } else {
                        context
                            .read<RandomImageBySubBreedBloc>()
                            .fetchRandomImageBySubBreed(
                                context
                                    .read<SelectedBreedForSubBreed>()
                                    .state
                                    .toString(),
                                context
                                    .read<SelectedSubBreedForSubBreed>()
                                    .state
                                    .toString());
                      }
                    },
                  ),
                ),
              if (context.watch<PageViewCubit>().state == 3)
                Flexible(
                  child: ActionChip(
                    elevation: 5.0,
                    visualDensity: VisualDensity.standard,
                    avatar: const Icon(Icons.pets, size: 17.0),
                    label: const Text('List Images by Sub-Breeds'),
                    onPressed: () {
                      if (context.read<SelectedBreedForListSubBreed>().state ==
                          null) {
                        context.read<MySnackBarCubit>().mySnackBar(
                            context,
                            const Text('Select One Breed!',
                                style: TextStyle(color: Colors.black)),
                            Colors.amber);
                      } else if (context.read<ImagesListBySubBreedBloc>().state
                          is ImagesListBySubBreedLoadingState) {
                        return;
                      } else if (context.read<InternetCubit>().state == false) {
                        context.read<MySnackBarCubit>().mySnackBar(
                            context,
                            const Text('Check Internet connection',
                                style: TextStyle(color: Colors.black)),
                            Colors.amber);
                      } else {
                        context
                            .read<ImagesListBySubBreedBloc>()
                            .fetchListImagesBySubBreed(
                                context
                                    .read<SelectedBreedForListSubBreed>()
                                    .state
                                    .toString(),
                                context
                                    .read<SelectedSubBreedForListSubBreed>()
                                    .state
                                    .toString());
                      }
                    },
                  ),
                ),
              //Arrow Forward PageView
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Center(
                    child: context.watch<PageViewCubit>().state == 3
                        ? const SizedBox(width: 30.0)
                        : IconButton(
                            onPressed: () => pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn),
                            icon: const Icon(Icons.arrow_forward)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
