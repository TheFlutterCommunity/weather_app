import 'package:flutter/material.dart';

import '../../../../index.dart';

class WeatherForecastViewListItem extends StatelessWidget {
  final Current hour;

  const WeatherForecastViewListItem({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: s3, vertical: half),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(s2),
        border: Border.all(color: greyOutlineColor),
      ),
      child: Row(
        children: [
          Expanded(
            flex: k1,
            child: Text(
              DateFormatUtils.formatTime(hour.time ?? kEmptyStringNa),
              style: TextStyle(
                fontSize: addSizing(s5, half),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          Expanded(
            flex: k1,
            child: Text(
              hour.condition?.text ?? kEmptyStringNa,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: addSizing(s3, half),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Spacer(),
          Expanded(
            flex: k1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                hour.condition?.icon != null
                    ? Image.network(
                        '$kHttp${hour.condition?.icon}$kNoCacheParam${DateTime.now().millisecondsSinceEpoch}',
                        height: s10,
                        width: s10,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.image_not_supported_rounded,
                            size: s6,
                            color: textColor,
                          );
                        },
                      )
                    : SizedBox(width: s6, height: s6),
                Text(
                  '${hour.tempC ?? kEmptyStringNa}$kCel',
                  style: TextStyle(
                    fontSize: addSizing(s3, half),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
