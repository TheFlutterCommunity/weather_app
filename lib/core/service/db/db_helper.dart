import '../../../index.dart';

abstract class DBHelper {
  /// Initialize database
  Future<void> initDB();

  /// Get row count
  Future<int> getRowCount();

  /// Insert weather details
  Future<int> saveWeatherDetails({
    required int userId,
    required WeatherDetails weatherDetails,
  });

  /// Delete weather details by user ID
  Future<int> delete(int userId);

  /// Get weather details by user ID
  Future<WeatherDetails?> getWeatherDetails({required int userId});

  /// Drop the weather table
  Future<void> dropWeatherTable({required String tableName});

  /// Clear the weather table
  Future<void> clearWeatherTable();

  /// Clear the table
  Future<void> clearTable({required String tableName});

  /// Close the database
  Future<void> close();
}
