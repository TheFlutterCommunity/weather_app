import 'dart:convert';
import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../../index.dart';

class DbHelperImpl extends DBHelper {
  static final DbHelperImpl _instance = DbHelperImpl._internal();
  static Database? _db;

  factory DbHelperImpl() => _instance;

  DbHelperImpl._internal();

  /// Get the database instance
  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  /// Initialize the database
  @override
  Future<Database> initDB() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, kDBName);

    return await openDatabase(path, version: kDBVersion, onCreate: _onCreate);
  }

  /// Create table with BLOB column
  Future<void> _onCreate(Database db, int version) async {
    await db.execute(createTableWeatherQuery);
  }

  /// Get row count
  @override
  Future<int> getRowCount() async {
    final dbClient = await db;
    final result = await dbClient.rawQuery(getCountQuery);
    return Sqflite.firstIntValue(result) ?? k0;
  }

  /// Insert weather details
  @override
  Future<int> saveWeatherDetails({
    required int userId,
    required WeatherDetails weatherDetails,
  }) async {
    final dbClient = await db;
    final data = {
      keyUId: userId,
      keyWeatherDetails: utf8.encode(json.encode(weatherDetails.toJson())),
    };

    return await dbClient.insert(
      tableWeather,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Delete weather details by user ID
  @override
  Future<int> delete(int userId) async {
    final dbClient = await db;
    return await dbClient.delete(
      tableWeather,
      where: '$keyUId = ?',
      whereArgs: [userId],
    );
  }

  /// Get weather details by user ID
  @override
  Future<WeatherDetails?> getWeatherDetails({required int userId}) async {
    final dbClient = await db;

    final result = await dbClient.query(
      tableWeather,
      where: '$keyUId = ?',
      whereArgs: [userId],
      limit: 1,
    );

    if (result.isNotEmpty) {
      final blob = result.first[keyWeatherDetails];
      if (blob != null && blob is Uint8List) {
        final jsonString = utf8.decode(blob as List<int>);
        final jsonMap = json.decode(jsonString);
        return WeatherDetails.fromJson(jsonMap);
      }
    }

    return null;
  }

  /// Drop the table weather
  @override
  Future<void> dropWeatherTable({required String tableName}) async {
    final dbClient = await db;
    await dbClient.execute('$dropTableWeatherQuery $tableName');
  }

  /// Clear the weather table
  @override
  Future<void> clearWeatherTable() async {
    final dbClient = await db;
    await dbClient.delete(tableWeather);
  }

  /// Clear the table
  @override
  Future<void> clearTable({required String tableName}) async {
    final dbClient = await db;
    await dbClient.delete(tableName);
  }

  /// Close the database
  @override
  Future<void> close() async {
    final dbClient = await db;
    await dbClient.close();
    _db = null;
  }
}
