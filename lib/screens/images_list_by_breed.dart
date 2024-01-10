import 'package:deliveristo_test/features/images_list_by_breed/presentation/widgets/list_of_dogs_images.dart';
import 'package:deliveristo_test/widgets/drop_down_image_list/image_list_dropdown_select.dart';
import 'package:flutter/material.dart';

class ImagesListByBreed extends StatefulWidget {
  const ImagesListByBreed({super.key});

  @override
  State<ImagesListByBreed> createState() => _ImagesListByBreedState();
}

class _ImagesListByBreedState extends State<ImagesListByBreed> {
  final ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        //Title Page
        SizedBox(
          height: 150.0,
          child: Center(
            child: Text(
              'Image List By Breed',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        //Breeds DropDown
        ImageListDropDownSelect(),
        //Dogs Image
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ListOfDogsImages(),
        )
      ],
    );
  }
}
