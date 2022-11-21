import 'package:dio/dio.dart';

class WeatherRemoteDataSource {
  Future<Map<String, dynamic>?> getWeatherModel({
    required String city,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'http://api.weatherapi.com/v1/current.json?key=da9a3f421d27455f89c75422221911&q=$city&aqi=no');
      return response.data;
    } on DioError catch (error) {
      throw Exception(error.response?.data['error']['message'] ?? 'Unknown Error');
    }
  }
}
