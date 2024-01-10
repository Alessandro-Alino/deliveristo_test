import 'package:deliveristo_test/features/images_list_by_sub_breed/presentation/widgets/list_of_dogs_images_sub.dart';
import 'package:deliveristo_test/widgets/dropdown_image_list_sub_breed/dropdown_image_list_sub_breed.dart';
import 'package:deliveristo_test/widgets/dropdown_image_list_sub_breed/dropdown_image_list_sub_breed_sub.dart';
import 'package:flutter/widgets.dart';

class ImagesListByBreedAndSubBreed extends StatelessWidget {
  const ImagesListByBreedAndSubBreed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        //Title Page
        SizedBox(
          height: 150.0,
          child: Center(
            child: Text(
              'Image List By Breed and Sub Breed',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        //Breeds DropDown
        ImageListSubDropDownSelect(),
        //SubBreeds DropDown
        ImageListSubBreedsDropDownSelect(),
        //List Dogs Image
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ListOfSubDogsImages(),
        )
      ],
    );
  }
}
