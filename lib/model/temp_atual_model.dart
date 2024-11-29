class TempAtual {
  final String? cityName;
  final double? temperature;

  TempAtual({this.cityName, this.temperature});

  factory TempAtual.fromJson(Map<String, dynamic> json) {
    return TempAtual(
      cityName: json['location']['name'],
      temperature: json['current']['temp_c'].toDouble(),
    );
  }
}
