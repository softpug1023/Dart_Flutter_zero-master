import 'dart:convert';

import 'package:advicer/0_data/exceptions/exceptions.dart';
import 'package:http/http.dart';

import '../models/advice_model.dart';

abstract class AdviceRemoteDataSource {
  /// requests a random advice from api
  /// returns [AdviceModel] if successful
  /// throw server exception if status code is not 200
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDataSourceImpl implements AdviceRemoteDataSource {
  final Client client;
  AdviceRemoteDataSourceImpl({required this.client});

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final Response response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice'),
      headers: {'content-type': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return AdviceModel.fromJson(responseBody);
    }
  }
}
