class LocationException implements Exception {
  final String message;

  LocationException({required this.message});

  @override
  String toString() => message;
}
