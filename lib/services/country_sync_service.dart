import 'country_api_service.dart';
import 'country_local_database.dart';
import '../country_repository.dart';

class CountrySyncService {
  static Future<List<Country>> loadInitialDataIfNeeded() async {
    if (!CountryLocalDatabase.isEmpty()) {
      return CountryLocalDatabase.getCountries();
    }

    final countries = await CountryApiService.fetchCountries();
    await CountryLocalDatabase.saveCountries(countries);

    return countries;
  }
}