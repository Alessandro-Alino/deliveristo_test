import 'package:deliveristo_test/core/services/api_services.dart';
import 'package:deliveristo_test/features/images_list_by_breed/domain/model/list_of_breed_model.dart';

class ListImagesByBreedUseCases {
  final BreedsServices breedsServices;

  ListImagesByBreedUseCases({required this.breedsServices});

  //Random Image By Breed
  Future<ListOfBreedModel> getListImageByBreed(String selectedBreed) async {
    var res = await breedsServices.fetchData('breed/$selectedBreed/images');
    ListOfBreedModel listOfBreedModel = ListOfBreedModel.fromJson(res);
    return listOfBreedModel;
  }
}
