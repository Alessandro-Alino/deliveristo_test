import 'package:deliveristo_test/core/services/api_services.dart';
import 'package:deliveristo_test/features/images_list_by_breed/domain/model/list_of_breed_model.dart';

class ListImagesBySubBreedUseCases {
  final BreedsServices breedsServices;

  ListImagesBySubBreedUseCases({required this.breedsServices});

  //Random Image By Breed
  Future<ListOfBreedModel> getListImageBySubBreed(
      String selectedBreed, String selectedSubBreed) async {
    var res = await breedsServices
        .fetchData('breed/$selectedBreed/$selectedSubBreed/images');
    ListOfBreedModel listOfBreedModel = ListOfBreedModel.fromJson(res);
    return listOfBreedModel;
  }
}
