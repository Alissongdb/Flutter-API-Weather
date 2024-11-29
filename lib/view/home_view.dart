import 'package:flutter/material.dart';
import 'package:weather_api/controller/temp_atual_controller.dart';
import 'package:weather_api/model/temp_atual_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final WeatherController _controller = WeatherController();
  TempAtual? _weatherData;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    TempAtual? data =
        (await _controller.fetchWeather('Pato Branco')) as TempAtual?;
    setState(() {
      _weatherData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Clima Atual')),
      body: Center(
        child: _weatherData != null
            ? Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue, spreadRadius: 2, blurRadius: 50),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cidade: ${_weatherData!.cityName}',
                    ),
                    Text('Temperatura: ${_weatherData!.temperature} °C'),
                  ],
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
