class Country {
  final String name;
  final String capital;
  final String flag;
  final String region;
  final String language;
  final String currency;
  final String code;

  Country({
    required this.name,
    required this.capital,
    required this.flag,
    required this.region,
    required this.language,
    required this.currency,
    required this.code,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "capital": capital,
      "flag": flag,
      "region": region,
      "language": language,
      "currency": currency,
      "code": code,
    };
  }

  factory Country.fromMap(Map map) {
    return Country(
      name: map["name"],
      capital: map["capital"],
      flag: map["flag"],
      region: map["region"],
      language: map["language"],
      currency: map["currency"],
      code: map["code"],
    );
  }
}