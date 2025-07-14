class ServiceConstants {
  /// Weather API
  ///http://api.weatherapi.com/v1/forecast.json?key=76c968f97c9644a983f83955242405&q=17.4435,78.3772
  static const String weatherAPIBaseUrl = 'http://api.weatherapi.com/';
  static const String getWeatherDetailsPath = 'v1/forecast.json';
  static const String weatherAPIKey = '76c968f97c9644a983f83955242405';

  /// AUth API
  static const String authBaseUrl = 'https://mocki.io/';

  /// Adding some conditional path to demonstrate success and failure response from Mock API
  /// https://mocki.io/v1/e6ececa4-7b11-4a62-a9ad-21217cea780b => Success
  /// https://mocki.io/v1/2b4ad8a2-5dec-4e2d-be32-8848f28673e5 => Error
  static const String signInPathSuccess =
      'v1/e6ececa4-7b11-4a62-a9ad-21217cea780b';
  static const String signInPathFailure =
      'v1/2b4ad8a2-5dec-4e2d-be32-8848f28673e5';
}
