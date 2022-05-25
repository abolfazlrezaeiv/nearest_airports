import 'dart:convert';
import 'package:get/get.dart';
import 'package:rezaei_flutter_test_task/constants/urls.dart';
import 'package:rezaei_flutter_test_task/data/database/database_helper.dart';
import 'package:rezaei_flutter_test_task/domain/interfaces/data_repository.dart';
import 'package:rezaei_flutter_test_task/domain/models/airport_model.dart';

class AirportRepository extends GetConnect implements DateRepository<Airport> {
  final DatabaseHelper databaseHelper;

  AirportRepository(this.databaseHelper);

  @override
  Future<List<Airport>> getAll() async {
    var response = await get(AppUrls.airportApiUrl);
    var jsonResponse = jsonDecode(response.body);
    var airports = List<Airport>.from(
        jsonResponse.map((model) => Airport.fromJson(model)));
    saveAirports(airports);
    return airports;
  }

  Future<List<Airport>> getAirports() async {
    return databaseHelper.getAirports();
  }

  Future<void> saveAirports(List<Airport> airports) async {
    for (var airport in airports) {
      await databaseHelper.insertAirport(airport);
    }
  }

  @override
  getById() {
    throw UnimplementedError();
  }
}
