import 'package:deliveristo_test/core/services/api_services.dart';
import 'package:deliveristo_test/features/random_image_by_breed/domain/model/single_breed_model.dart';

class RandomBreedsUseCases {
  final BreedsServices breedsServices;

  RandomBreedsUseCases({required this.breedsServices});

  //Random Image By Breed
  Future<SingleBreedModel> getRandomImageByBreed(String selectedBreed) async {
    var res =
        await breedsServices.fetchData('breed/$selectedBreed/images/random');
    SingleBreedModel singleBreedModel = SingleBreedModel.fromJson(res);
    return singleBreedModel;
  }
}
