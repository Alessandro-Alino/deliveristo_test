import 'package:deliveristo_test/features/images_list_by_breed/presentation/bloc/images_list_by_breed_bloc.dart';
import 'package:deliveristo_test/features/images_list_by_sub_breed/presentation/bloc/images_list_by_sub_breed_bloc.dart';
import 'package:deliveristo_test/features/images_list_by_sub_breed/presentation/cubit/selected_breed_image_list.dart';
import 'package:deliveristo_test/features/list_all_breeds/presentation/cubit/selected_breed.dart';
import 'package:deliveristo_test/features/random_image_by_breed/presentation/bloc/random_image_by_breed_bloc.dart';
import 'package:deliveristo_test/features/random_image_by_sub_breed/presentation/bloc/random_image_by_sub_breed_bloc.dart';
import 'package:deliveristo_test/features/random_image_by_sub_breed/presentation/cubit/selected_breed_subbreed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    //Avatar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          maxRadius: 40.0,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.light_mode))
                      ],
                    ),
                    //UserName
                    const ListTile(title: Text('User'))
                  ],
                ),
              ),
              //List Drawer
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                  MediaQuery.of(context).size.width >= 600.0
                      ? null
                      : Navigator.pop(context);
                },
              ),
              Builder(
                builder: (context) {
                  final stateRandomBreed =
                      context.watch<RandomImageByBreedBloc>();
                  final stateImagesList =
                      context.watch<ImagesListByBreedBloc>();
                  final stateSubBreed =
                      context.watch<RandomImageBySubBreedBloc>();
                  final stateImageListSub =
                      context.watch<ImagesListBySubBreedBloc>();
                  final stateSelectedBreed = context.watch<SelectedBreed>();
                  final stateSelectedBreedForImageList =
                      context.watch<SelectedBreedForImageList>();
                  final stateBreedforSubBreed =
                      context.watch<SelectedBreedForSubBreed>();
                  final stateSubBreedforSubBreed =
                      context.watch<SelectedSubBreedForSubBreed>();

                  final selectedBreedForListSubBreed =
                      context.watch<SelectedBreedForListSubBreed>();
                  final selectedSubBreedForListSubBreed =
                      context.watch<SelectedSubBreedForListSubBreed>();

                  return ListTile(
                    leading: const Icon(Icons.replay_outlined),
                    title: const Text('Reset'),
                    onTap: () {
                      MediaQuery.of(context).size.width >= 600.0
                          ? null
                          : Navigator.pop(context);
                      //Restore the setting
                      stateRandomBreed.reset();
                      stateImagesList.reset();
                      stateSubBreed.reset();
                      stateImageListSub.reset();
                      stateSelectedBreed.selectBreedRandomImage(null);
                      stateSelectedBreedForImageList
                          .selectBreedForImageList(null);
                      stateBreedforSubBreed.selectBreedForSubBreed(null);
                      stateSubBreedforSubBreed.selectSubBreedForSubBreed(null);
                      selectedBreedForListSubBreed
                          .selectBreedForListSubBreed(null);
                      selectedSubBreedForListSubBreed
                          .selectSubBreedForListSubBreed(null);
                    },
                  );
                },
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('About'),
          onTap: () {
            MediaQuery.of(context).size.width >= 600.0
                ? null
                : Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Dogs 🐾'),
                  content: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          'All images are provided by "https://dog.ceo/dog-api".')
                    ],
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'))
                      ],
                    )
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
