import 'package:hive_ce/hive.dart';
import '../country_repository.dart';

class CountryLocalDatabase {
  static Box get _box => Hive.box("countries");

  static List<Country> getCountries() {
    return _box.values.map((item) {
      return Country.fromMap(
        Map<String, dynamic>.from(item),
      );
    }).toList();
  }

  static Future<void> saveCountries(List<Country> countries) async {
    await _box.clear();

    for (final country in countries) {
      await _box.put(
        country.code,
        country.toMap(),
      );
    }
  }

  static bool isEmpty() {
    return _box.isEmpty;
  }
}