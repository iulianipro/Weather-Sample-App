import 'package:flutter/material.dart';

Widget currentWeather(String icon, String temp, String location) {
  return Center(
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://openweathermap.org/img/wn/$icon@2x.png'),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            "$temp",
            style: const TextStyle(
              fontSize: 46.0,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            "$location",
            style: const TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 20.0,
                color: Color.fromARGB(255, 29, 24, 24)),
          )
        ]),
  );
}
