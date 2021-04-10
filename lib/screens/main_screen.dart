import 'package:flutter/material.dart';
import 'package:flutter_app/utils/weather.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  final WeatherData weatherData;

  const MainScreen({@required this.weatherData});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bulutlu.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Container(
                child: Icon(
                  FontAwesomeIcons.cloud,
                  size: 75,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text("12°",style: TextStyle(color: Colors.white,fontSize: 80,letterSpacing: -5,fontWeight: FontWeight.bold),),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
