import 'package:deliveristo_test/widgets/drop_down_random_breed/breeds_dropdown_select.dart';
import 'package:deliveristo_test/features/random_image_by_breed/presentation/widgets/dogs_images.dart';
import 'package:flutter/material.dart';

class RandomImageByBreed extends StatelessWidget {
  const RandomImageByBreed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        //Title Page
        SizedBox(
          height: 150.0,
          child: Center(
            child: Text(
              'Random Image By Breed',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        //Breeds DropDown
        BreedsDropDownSelect(),
        //Dogs Image
        Center(
          child: DogsImages(),
        ),
      ],
    );
  }
}
