import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveristo_test/features/list_all_breeds/presentation/cubit/selected_breed.dart';
import 'package:deliveristo_test/features/random_image_by_breed/presentation/bloc/random_image_by_breed_bloc.dart';
import 'package:deliveristo_test/screens/image_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogsImages extends StatelessWidget {
  const DogsImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomImageByBreedBloc, RandomImageByBreedState>(
      builder: (context, state) {
        if (state is RandomImageByBreedInitialState ||
            context.read<SelectedBreed>().state == null) {
          return Center(
            child: Image.asset(
              'assets/images/dog_photo.png',
              width: 600.0,
              height: 400.0,
            ),
          );
        }
        if (state is RandomImageByBreedLoadingState) {
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
        if (state is RandomImageByBreedLoadedState) {
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
                      key: const Key('RandomImageCached'),
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
        if (state is RandomImageByBreedErrorState) {
          return Text('Errore: ${state.error}');
        }
        return const Text('What RandomImageByBreedErrorState');
      },
    );
  }
}
