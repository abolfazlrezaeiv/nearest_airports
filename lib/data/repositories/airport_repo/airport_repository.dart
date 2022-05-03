import 'dart:convert';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:rezaei_flutter_test_task/constants/database_queries.dart';
import 'package:rezaei_flutter_test_task/constants/urls.dart';
import 'package:rezaei_flutter_test_task/domain/base/base_repository.dart';
import 'package:rezaei_flutter_test_task/domain/models/airport_model.dart';
import 'package:sqflite/sqflite.dart';

class AirportRepository extends GetConnect implements BaseRepository<Airport> {
  @override
  Future<List<Airport>> getAll() async {
    var response = await get(AppUrls.airportApiUrl);
    var jsonResponse = jsonDecode(response.body);
    var airports = List<Airport>.from(
        jsonResponse.map((model) => Airport.fromJson(model)));
    for (var airport in airports) {
      await insertAirport(airport);
    }
    var airp = await getAirportsFromDB();
    print(airp);
    return airports;
  }

  Future<List<Airport>> getAirportsFromDB() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps =
        await db.query(DatabaseQuery.airportTable);
    return List.generate(maps.length, (index) => Airport.fromJson(maps[index]));
  }

  Future<void> insertAirport(Airport airport) async {
    final db = await getDatabase();
    await db.insert(
      DatabaseQuery.airportTable,
      airport.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DatabaseQuery.airportTablePath),
      onCreate: (db, version) =>
          db.execute(DatabaseQuery.queryCreateAirportTable),
      version: 1,
    );
  }

  @override
  getById() {
    throw UnimplementedError();
  }
}
