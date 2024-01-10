import 'package:dio/dio.dart';

class APIsRepoRequest {
  final Dio _dio = Dio();
  APIsRepoRequest() {
    _dio.options.baseUrl = 'https://dog.ceo/api/';
  }
  Dio get sendRequest => _dio;
}

class BreedsServices {
  APIsRepoRequest api = APIsRepoRequest();

  fetchData(String endpoint) async {
    try {
      var response = await api.sendRequest.get(endpoint);
      return response.data;
    } catch (error) {
      throw Exception('Can\'t load fetchData.');
    }
  }
}
