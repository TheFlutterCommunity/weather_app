/// Table
const tableWeather = 'TABLE_WEATHER';

/// Fields
const keyUId = 'USER_ID';
const keyWeatherDetails = 'WEATHER_DETAILS';

/// Database Config
const kDBVersion = 1;
const kDBName = 'weather.db';

/// Queries
const createTableWeatherQuery =
    '''CREATE TABLE $tableWeather (
$keyUId INTEGER PRIMARY KEY AUTOINCREMENT,
$keyWeatherDetails BLOB
)''';

const getCountQuery = 'SELECT COUNT(*) FROM $tableWeather';

const dropTableWeatherQuery = 'DROP TABLE IF EXISTS';
