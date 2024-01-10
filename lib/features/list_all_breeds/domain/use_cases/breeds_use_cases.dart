import 'package:deliveristo_test/features/list_all_breeds/domain/model/response_model/response_model.dart';
import 'package:deliveristo_test/core/services/api_services.dart';
import 'package:deliveristo_test/features/list_all_breeds/domain/model/breeds_model/breeds_model.dart';

class BreedsUseCases {
  final BreedsServices breedsServices;

  BreedsUseCases({required this.breedsServices});

  //Get All Breeds List With SubCateg
  Future<List<BreedsModel>> getListAllBreeds() async {
    var res = await breedsServices.fetchData('breeds/list/all');
    ResponseModel response = ResponseModel.fromJson(res);
    List<BreedsModel> listSingleBreeds = response.message.entries
        .map((breeds) =>
            BreedsModel(breedName: breeds.key, listSubBreeds: breeds.value))
        .toList();
    return listSingleBreeds;
  }

  //Random Image By Breed
  Future<List<BreedsModel>> getRandomImageByBreed(String selectedBreed) async {
    var res =
        await breedsServices.fetchData('breed/$selectedBreed/images/random');
    ResponseModel response = ResponseModel.fromJson(res);
    List<BreedsModel> listSingleBreeds = response.message.entries
        .map((breeds) =>
            BreedsModel(breedName: breeds.key, listSubBreeds: breeds.value))
        .toList();
    return listSingleBreeds;
  }
}
