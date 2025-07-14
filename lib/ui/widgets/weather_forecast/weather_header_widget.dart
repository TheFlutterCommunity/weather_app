import 'package:flutter/material.dart';

import '../../../index.dart';

class WeatherHeaderWidget extends StatelessWidget {
  final Location? location;
  final Current? current;

  const WeatherHeaderWidget({
    super.key,
    required this.location,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: s2, vertical: s1),
      margin: EdgeInsets.only(bottom: s4),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(s2),
        border: Border.all(color: greyOutlineColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                location?.name ?? kEmptyStringNa,
                style: TextStyle(fontSize: s6, fontWeight: FontWeight.bold),
              ),
              Text(
                '${location?.region ?? kEmptyStringNa}, ${location?.country ?? kEmptyStringNa}',
                style: TextStyle(color: blackColor),
              ),
            ],
          ),
          SizedBox(height: s3),
          Text(
            '${current?.tempC ?? kDash}$kCel',
            style: TextStyle(fontSize: s6, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: s3),
          Row(
            children: [
              Row(
                children: [
                  current?.condition?.icon != null
                      ? Image.network(
                          '$kHttp${current?.condition?.icon}$kNoCacheParam${DateTime.now().millisecondsSinceEpoch}',
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
                  SizedBox(width: s1),
                  Text(
                    current?.condition?.text ?? kEmptyStringNa,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: addSizing(s4, half),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                DateFormatUtils.formatDate(location?.localtime ?? kEmptyString),
                style: TextStyle(
                  fontSize: addSizing(s3, half),
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
