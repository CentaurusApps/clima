import 'package:clima_domain/entities/weather.dart';
import 'package:clima_ui/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'value_tile.dart';

/// Renders a horizontal scrolling list of weather conditions
/// Used to show forecast
/// Shows DateTime, Weather Condition icon and Temperature
class ForecastHorizontal extends StatelessWidget {
  const ForecastHorizontal({this.forecast});
  final List<Weather> forecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: forecast.length,
        separatorBuilder: (context, index) => const Divider(
          height: 100,
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (context, index) {
          final item = forecast[index];
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
              child: ValueTile(
                DateFormat('E, ha').format(
                    DateTime.fromMillisecondsSinceEpoch(item.time * 1000)),
                '${item.temperature}°', //.as(AppStateContainer.of(context).temperatureUnit).round()}°',
                iconData: getIconData(item.iconCode),
              ),
            ),
          );
        },
      ),
    );
  }
}
