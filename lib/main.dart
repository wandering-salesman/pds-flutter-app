import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Chair Posture Detection App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'PDA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "Posture Detection App";
  double sensorValue1 = 50.0;
  double sensorValue2 = 100.0;
  double sensorValue3 = 150.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              // First speedometer
              Container(
                height: 200,
                width: 200,
                padding: EdgeInsets.all(16.0),
                child: KdGaugeView(
                  minSpeed: 0.0,
                  maxSpeed: 250.0,
                  speed: sensorValue1,
                  speedTextStyle: const TextStyle(
                    color: Color(0xFFC41A3B),
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  animate: true,
                  duration: Duration(seconds: 1),
                  subDivisionCircleColors: Color(0xFFC41A3B),
                  divisionCircleColors: Color(0xFF1B1F32),
                  fractionDigits: 2,
                  activeGaugeColor: Color(0xFFC41A3B),
                  innerCirclePadding: 16.0,
                  unitOfMeasurement: "",
                  unitOfMeasurementTextStyle: TextStyle(
                    color: Color(0xFFC41A3B),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  minMaxTextStyle: TextStyle(
                    color: Color(0xFFC41A3B),
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                  gaugeWidth: 6.0,
                ),
              ),
              Container(
                height: 200,
                width: 200,
                padding: EdgeInsets.all(16.0),
                child: KdGaugeView(
                  minSpeed: 0.0,
                  maxSpeed: 250.0,
                  speed: sensorValue2,
                  speedTextStyle: const TextStyle(
                    color: Color(0xFFC41A3B),
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  animate: true,
                  duration: Duration(seconds: 1),
                  subDivisionCircleColors: Color(0xFFC41A3B),
                  divisionCircleColors: Color(0xFF1B1F32),
                  fractionDigits: 2,
                  activeGaugeColor: Color(0xFFC41A3B),
                  innerCirclePadding: 16.0,
                  unitOfMeasurement: "",
                  unitOfMeasurementTextStyle: TextStyle(
                    color: Color(0xFFC41A3B),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  minMaxTextStyle: TextStyle(
                    color: Color(0xFFC41A3B),
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                  gaugeWidth: 6.0,
                ),
              ),
              Container(
                height: 200,
                width: 200,
                padding: EdgeInsets.all(16.0),
                child: KdGaugeView(
                  minSpeed: 0.0,
                  maxSpeed: 250.0,
                  speed: sensorValue3,
                  speedTextStyle: const TextStyle(
                    color: Color(0xFFC41A3B),
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  animate: true,
                  duration: Duration(seconds: 1),
                  subDivisionCircleColors: Color(0xFFC41A3B),
                  divisionCircleColors: Color(0xFF1B1F32),
                  fractionDigits: 2,
                  activeGaugeColor: Color(0xFFC41A3B),
                  innerCirclePadding: 16.0,
                  unitOfMeasurement: "",
                  unitOfMeasurementTextStyle: TextStyle(
                    color: Color(0xFFC41A3B),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  minMaxTextStyle: TextStyle(
                    color: Color(0xFFC41A3B),
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                  gaugeWidth: 6.0,
                ),
              ),
            ])));
  }
}