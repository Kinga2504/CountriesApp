import 'package:flutter/material.dart';
import 'country_repository.dart';
import 'services/country_api_service.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'services/country_sync_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox("countries");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Countries App",
      debugShowCheckedModeBanner: false,
      home: const CountryListScreen(),
    );
  }
}

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  late Future<List<Country>> countriesFuture;
  String searchText = "";

  @override
  void initState() {
    super.initState();
    countriesFuture = CountrySyncService.loadCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista krajów")),
      body: FutureBuilder<List<Country>>(
        future: countriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Błąd: ${snapshot.error}"));
          }

          final countries = snapshot.data ?? [];

          final filteredCountries = countries.where((country) {
            return country.name.toLowerCase().contains(
              searchText.toLowerCase(),
            );
          }).toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Wyszukaj kraj",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredCountries.length,
                  itemBuilder: (context, index) {
                    final country = filteredCountries[index];

                    return Card(
                      child: ListTile(
                        leading: Image.network(
                            country.flag,
                            width: 50,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.flag);
                              },
                        ),
                        title: Text(country.name),
                        subtitle: Text("Stolica: ${country.capital}"),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CountryDetailsScreen(code: country.code),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CountryDetailsScreen extends StatefulWidget {
  final String code;

  const CountryDetailsScreen({super.key, required this.code});

  @override
  State<CountryDetailsScreen> createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {
  late Future<Country> countryFuture;

  @override
  void initState() {
    super.initState();
    countryFuture = CountryApiService.fetchCountryDetails(widget.code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Szczegóły kraju")),
      body: FutureBuilder<Country>(
        future: countryFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Błąd: ${snapshot.error}"));
          }

          final country = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.network(
                    country.flag,
                    width: 160,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.flag, size: 80);
                      },
                )),
                const SizedBox(height: 20),
                Text("Nazwa: ${country.name}"),
                Text("Stolica: ${country.capital}"),
                Text("Region: ${country.region}"),
                Text("Język: ${country.language}"),
                Text("Waluta: ${country.currency}"),
                Text("Kod kraju: ${country.code}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
