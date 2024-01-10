import 'package:deliveristo_test/features/list_all_breeds/domain/model/breeds_model/breeds_model.dart';
import 'package:deliveristo_test/features/list_all_breeds/presentation/cubit/selected_breed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownImageListBreed extends StatelessWidget {
  const DropDownImageListBreed({super.key, required this.breedsList});

  final List<BreedsModel> breedsList;

  @override
  Widget build(BuildContext context) {
    //From List of Breeds and SubBreeds, Create a TreeList of DropDownMenuItem
    getDropdownMenuItems(List<BreedsModel> breedsList) {
      List<DropdownMenuItem> dropDownList = [];
      for (BreedsModel breedsModel in breedsList) {
        if (breedsModel.listSubBreeds.isEmpty) {
          dropDownList.add(DropdownMenuItem(
              value: breedsModel.breedName.toLowerCase(),
              child: Text(breedsModel.breedName.replaceFirst(
                  breedsModel.breedName[0],
                  breedsModel.breedName[0].toUpperCase()))));
        } else {
          dropDownList.add(DropdownMenuItem(
              value: breedsModel.breedName.toLowerCase(),
              child: Text(breedsModel.breedName.replaceFirst(
                  breedsModel.breedName[0],
                  breedsModel.breedName[0].toUpperCase()))));
          for (String subBreed in breedsModel.listSubBreeds) {
            dropDownList.add(
              DropdownMenuItem(
                  value: '${breedsModel.breedName}/${subBreed.toLowerCase()}',
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                        ' ${breedsModel.breedName.replaceFirst(breedsModel.breedName[0], breedsModel.breedName[0].toUpperCase())} - ${subBreed.replaceFirst(subBreed[0], subBreed[0].toUpperCase())}'),
                  )),
            );
          }
        }
      }
      return dropDownList;
    }

    return BlocBuilder<SelectedBreedForImageList, String?>(
      builder: (context, state) {
        return Theme(
          data: Theme.of(context).copyWith(
            canvasColor: const Color.fromARGB(255, 245, 229, 224),
          ),
          child: DropdownButton(
            underline: const SizedBox(),
            menuMaxHeight: 500.0,
            borderRadius: BorderRadius.circular(10),
            items: getDropdownMenuItems(breedsList),
            isExpanded: true,
            hint: const Text('Select Breed'),
            value: context.read<SelectedBreedForImageList>().state,
            onChanged: (value) {
              context
                  .read<SelectedBreedForImageList>()
                  .selectBreedForImageList(value);
            },
          ),
        );
      },
    );
  }
}
