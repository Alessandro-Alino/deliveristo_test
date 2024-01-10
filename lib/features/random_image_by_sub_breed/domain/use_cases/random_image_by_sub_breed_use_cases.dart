import 'package:deliveristo_test/core/services/api_services.dart';
import 'package:deliveristo_test/features/random_image_by_breed/domain/model/single_breed_model.dart';

class RandomSubBreedsUseCases {
  final BreedsServices breedsServices;

  RandomSubBreedsUseCases({required this.breedsServices});

  //Random Image By Breed
  Future<SingleBreedModel> getRandomImageBySubBreed(
      String selectedBreed, String selectedSubBreed) async {
    var res = await breedsServices
        .fetchData('breed/$selectedBreed/$selectedSubBreed/images/random');

    SingleBreedModel singleBreedModel = SingleBreedModel.fromJson(res);
    return singleBreedModel;
  }
}
