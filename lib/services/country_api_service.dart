import 'dart:convert';
import 'package:http/http.dart' as http;
import '../country_repository.dart';

class CountryApiService {
  static const String baseUrl = "https://restcountries.com/v3.1";

  static Future<List<Country>> fetchCountries() async {
    final response = await http.get(
      Uri.parse("$baseUrl/all?fields=name,capital,flags,region,languages,currencies,cca3"),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data.map((country) {
        return Country(
          name: country["name"]["common"],
          capital: country["capital"] != null && country["capital"].isNotEmpty
              ? country["capital"][0]
              : "brak",
          flag: country["flags"]["png"],
          region: country["region"],
          language: country["languages"] != null && country["languages"].isNotEmpty
              ? country["languages"].values.first
              : "brak",
          currency: country["currencies"] != null && country["currencies"].isNotEmpty
              ? country["currencies"].keys.first
              : "brak",
          code: country["cca3"],
        );
      }).toList();
    } else {
      throw Exception("Błąd pobierania krajów");
    }
  }
}