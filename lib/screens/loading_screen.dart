import 'package:flutter/material.dart';
import 'package:flutter_app/screens/main_screen.dart';
import 'package:flutter_app/utils/location.dart';
import 'package:flutter_app/utils/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LocationHelper locationData;
  Future <void> getLocationData() async {
    locationData = LocationHelper();
    await locationData.getCurrentLocation();

    if(locationData.latitude == null || locationData.longitude == null) {
      print("Konum Bilgileri gelmiyor..");
    }
    else {
      print("latitute : " + locationData.latitude.toString() + " longitude : " + locationData.latitude.toString());
    }
  }

  void getWeatherData() async {
    await getLocationData();
    WeatherData weatherData = WeatherData(locationData: locationData);
    await weatherData.getCurrentTemperature();

    if(weatherData.currentTemperature == null || weatherData.currentCondition == null) {
      print("API'den sıcaklık ve durum bilgisi boş dönüyor.");
    }
    else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen(weatherData: weatherData,)));
    }
  }

  @override
  void initState() {

    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurpleAccent,Colors.blueAccent],
          ),
        ),
        child: Center(
          child: SpinKitRipple(
            color: Colors.white,
            size: 100,
            duration: Duration(milliseconds: 2000),
          ),
        ),
      ),
    );
  }
}
