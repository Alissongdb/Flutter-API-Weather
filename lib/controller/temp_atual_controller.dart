import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_api/model/temp_atual_model.dart';

class WeatherController {
  final String apiKey = 'f1cbed65cf0f4922a5203206242911';
  final String baseUrl = 'http://api.weatherapi.com/v1/current.json';

  Future<Object> fetchWeather(String city) async {
    final url = Uri.parse('$baseUrl?key=$apiKey&q=$city');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return TempAtual.fromJson(data);
    } else {
      return ('Falha na requisicao');
    }
  }
}
