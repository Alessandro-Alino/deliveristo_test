import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveristo_test/features/random_image_by_sub_breed/presentation/bloc/random_image_by_sub_breed_bloc.dart';
import 'package:deliveristo_test/features/random_image_by_sub_breed/presentation/cubit/selected_breed_subbreed.dart';
import 'package:deliveristo_test/screens/image_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogsSubBreedImages extends StatelessWidget {
  const DogsSubBreedImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomImageBySubBreedBloc, RandomImageBySubBreedState>(
      builder: (context, state) {
        if (state is RandomImageBySubBreedInitialState ||
            context.read<SelectedBreedForSubBreed>().state == null) {
          return Center(
            child: Image.asset(
              'assets/images/dog_photo.png',
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
                child: Image.asset(
                  'assets/images/placeholder_dog.png',
                  width: 100.0,
                  height: 100.0,
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
                          child: Image.asset(
                            'assets/images/placeholder_dog.png',
                            width: 100.0,
                            height: 100.0,
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
