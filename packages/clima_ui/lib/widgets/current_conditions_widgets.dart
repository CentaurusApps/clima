import 'package:auto_size_text/auto_size_text.dart';
import 'package:clima_ui/state_notifiers/weather_state_notifier.dart';
import 'package:clima_ui/utilities/weather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import 'value_tile.dart';

/// Renders Weather Icon, current, min and max temperatures
class CurrentConditions extends HookWidget {
  const CurrentConditions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weather = useProvider(weatherStateNotifierProvider).weather;

    if (weather == null) {
      return const SizedBox.shrink();
    }

    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: AutoSizeText(
                weather.cityName.toUpperCase(),
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 5,
                  color: Theme.of(context).textTheme.subtitle1.color,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            child: AutoSizeText(
              weather.description.toUpperCase(),
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w100,
                letterSpacing: 5,
                fontSize: 12.sp,
                color: Theme.of(context).textTheme.subtitle1.color,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Icon(
            getIconData(weather.iconCode),
            color: Theme.of(context).textTheme.subtitle1.color,
            size: 60.sp,
          ),
        ),
        Expanded(
          flex: 3,
          child: AutoSizeText(
            '${weather.temperature.round()}°',
            maxLines: 1,
            style: TextStyle(
              fontSize: 1000,
              fontWeight: FontWeight.w100,
              color: Theme.of(context).textTheme.subtitle1.color,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ValueTile('max', '${weather.maxTemperature.round()}°'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Container(
                    width: 1,
                    height: 4.5.h,
                    color: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .color
                        .withAlpha(65),
                  ),
                ),
              ),
              ValueTile('min', '${weather.minTemperature.round()}°'),
            ],
          ),
        ),
      ],
    );
  }
}
