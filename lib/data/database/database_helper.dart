import 'package:path/path.dart';
import 'package:rezaei_flutter_test_task/constants/database_queries.dart';
import 'package:rezaei_flutter_test_task/domain/models/airport_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._internal();

  DatabaseHelper._internal();

  factory DatabaseHelper() => _databaseHelper;

  static Database? _db;

  Future<Database> get db async {
    _db ??= await initializeDb();
    return _db!;
  }

  Future<Database> initializeDb() async {
    String path =
        join(await getDatabasesPath(), DatabaseQuery.airportTablePath);
    var db = await openDatabase(path, version: 1, onCreate: _createDb);
    return db;
  }

  void _createDb(Database db, int version) async {
    await db.execute(DatabaseQuery.queryCreateAirportTable);
  }

  Future<void> insertAirport(Airport airport) async {
    Database db = await this.db;
    try {
      await db.insert(
        DatabaseQuery.airportTable,
        airport.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (_) {}
  }

  Future<List<Airport>> getAirports() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> maps =
        await db.query(DatabaseQuery.airportTable);
    return List.generate(maps.length, (index) => Airport.fromJson(maps[index]));
  }
}
