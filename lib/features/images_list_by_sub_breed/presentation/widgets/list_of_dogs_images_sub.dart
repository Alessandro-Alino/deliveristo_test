import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveristo_test/features/images_list_by_sub_breed/presentation/bloc/images_list_by_sub_breed_bloc.dart';
import 'package:deliveristo_test/screens/image_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ListOfSubDogsImages extends StatelessWidget {
  const ListOfSubDogsImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagesListBySubBreedBloc, ImagesListBySubBreedState>(
      builder: (context, state) {
        if (state is ImagesListBySubBreedInitialState) {
          return Center(
              child: Container(
                  constraints: const BoxConstraints(maxWidth: 500.0),
                  child: const PlaceHolderListOfDogs()));
        } else if (state is ImagesListBySubBreedLoadingState) {
          return Center(
            child: Lottie.asset(
              'assets/lottie/placeholder_loading.json',
              width: 120.0,
              height: 120.0,
            ),
          );
        } else if (state is ImagesListBySubBreedLoadedState) {
          return Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.listOfSubBreedModel.message.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ImageDetails(
                              singleBreed:
                                  state.listOfSubBreedModel.message[index],
                              url: state.listOfSubBreedModel.message[index]),
                        )),
                    child: Card(
                      child: Hero(
                        tag:
                            state.listOfSubBreedModel.message[index].toString(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: state.listOfSubBreedModel.message[index],
                            placeholder: (context, url) {
                              return Center(
                                child: Lottie.asset(
                                    'assets/lottie/placeholder_loading.json',
                                    width: 120.0,
                                    height: 120.0),
                              );
                            },
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is ImagesListBySubBreedErrorState) {
          return Center(child: Text('Errore: ${state.error}'));
        }
        return const Text('What List of Dogs Doing?!');
      },
    );
  }
}

class PlaceHolderListOfDogs extends StatelessWidget {
  const PlaceHolderListOfDogs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        children: [
          GridView.builder(
            itemCount: 6,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return const Card();
            },
          ),
          Container(
            height: 500.0,
            width: 500.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: const Padding(
                  padding: EdgeInsets.only(top: 40.0, right: 60.0, left: 60.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        size: 30.0,
                      ),
                      Text(
                        'Select Breed',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40.0),
                      Text(
                        'Then click the button to see the List of Images by Breed',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
