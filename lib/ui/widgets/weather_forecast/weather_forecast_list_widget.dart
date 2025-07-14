import 'package:flutter/material.dart';

import '../../../index.dart';

class WeatherForeCastListWidget extends StatelessWidget {
  final List<Current> hourly;
  const WeatherForeCastListWidget({super.key, required this.hourly});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: hourly.length,
        separatorBuilder: (context, _) => SizedBox(height: s3),
        itemBuilder: (context, index) =>
            WeatherForecastViewListItem(hour: hourly[index]),
      ),
    );
  }
}
