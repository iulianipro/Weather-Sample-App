import 'package:flutter/material.dart';
import 'package:sampleprojekt/model/weather_model.dart';
import 'package:sampleprojekt/services/weathet_api_client.dart';
import 'package:sampleprojekt/views/additional_information.dart';
import 'package:sampleprojekt/views/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherApiClinet client = WeatherApiClinet();
  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather("Trestiana");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 215, 170, 224),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 156, 140, 228),
          elevation: 0.0,
          title: const Text(
            "Weather Center",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.white,
          ),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  currentWeather(
                      "${data!.icon}", "${data!.temp}", "${data!.cityName}"),
                  const SizedBox(
                    height: 60.0,
                  ),
                  const Text(
                    "Additional Information",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xdd212121),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  //additional info
                  additionalInformation("${data!.wind}", "${data!.pressure}",
                      "${data!.humidity}", "${data!.feelsLike}"),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(color: Colors.red[80]));
            }

            return Container();
          },
        ));
  }
}
