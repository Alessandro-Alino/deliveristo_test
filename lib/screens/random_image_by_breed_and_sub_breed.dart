import 'package:deliveristo_test/features/random_image_by_sub_breed/presentation/widgets/dogs_sub_breed_images.dart';
import 'package:deliveristo_test/widgets/dropdown_sub_breed/dropdown_sub_breed.dart';
import 'package:deliveristo_test/widgets/dropdown_sub_breed/dropdown_sub_breed_sub.dart';
import 'package:flutter/material.dart';

class RandomImageByBreedAndSubBreed extends StatelessWidget {
  const RandomImageByBreedAndSubBreed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        //Title Page
        SizedBox(
          height: 150.0,
          child: Center(
            child: Text(
              'Random Image By Breed and Sub Breed',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        //Breeds DropDown
        BreedsSubDropDownSelect(),
        //SubBreeds DropDown
        SubBreedsDropDownSelect(),
        //Dogs Image
        Center(
          child: DogsSubBreedImages(),
        ),
      ],
    );
  }
}
