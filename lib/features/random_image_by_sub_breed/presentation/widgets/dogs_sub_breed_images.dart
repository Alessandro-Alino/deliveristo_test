import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveristo_test/features/random_image_by_sub_breed/presentation/bloc/random_image_by_sub_breed_bloc.dart';
import 'package:deliveristo_test/features/random_image_by_sub_breed/presentation/cubit/selected_breed_subbreed.dart';
import 'package:deliveristo_test/screens/image_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class DogsSubBreedImages extends StatefulWidget {
  const DogsSubBreedImages({super.key});

  @override
  State<DogsSubBreedImages> createState() => _DogsImagesState();
}

class _DogsImagesState extends State<DogsSubBreedImages>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomImageBySubBreedBloc, RandomImageBySubBreedState>(
      builder: (context, state) {
        if (state is RandomImageBySubBreedInitialState ||
            context.read<SelectedBreedForSubBreed>().state == null) {
          return Center(
            child: Lottie.asset(
              'assets/lottie/dogs_photo.json',
              controller: _animationController,
              onLoaded: (composition) {
                _animationController
                  ..duration = composition.duration
                  ..forward();
              },
              width: 600.0,
              height: 400.0,
            ),
          );
        }
        if (state is RandomImageBySubBreedLoadingState) {
          return SizedBox(
            height: 350.0,
            width: 350.0,
            child: Card(
              elevation: 10.0,
              child: Center(
                child: Lottie.asset(
                  'assets/lottie/placeholder_loading.json',
                  controller: _animationController,
                  onLoaded: (composition) {
                    _animationController
                      ..duration = composition.duration
                      ..forward();
                  },
                  width: 120.0,
                  height: 120.0,
                ),
              ),
            ),
          );
        }
        if (state is RandomImageBySubBreedLoadedState) {
          return SizedBox(
            height: 350.0,
            width: 350.0,
            child: Card(
              elevation: 10.0,
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ImageDetails(
                        singleBreed: state.singleRandomImageByBreed.message,
                        url: state.singleRandomImageByBreed.message,
                      ),
                    )),
                child: Hero(
                  tag: state.singleRandomImageByBreed.message.toString(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: state.singleRandomImageByBreed.message,
                      placeholder: (context, url) {
                        return Center(
                          child: Lottie.asset(
                            'assets/lottie/placeholder_loading.json',
                            controller: _animationController,
                            onLoaded: (composition) {
                              _animationController
                                ..duration = composition.duration
                                ..forward();
                            },
                            width: 120.0,
                            height: 120.0,
                          ),
                        );
                      },
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        if (state is RandomImageBySubBreedErrorState) {
          return Text('Errore: ${state.error}');
        }
        return const Text('What RandomImageByBreedErrorState');
      },
    );
  }
}
