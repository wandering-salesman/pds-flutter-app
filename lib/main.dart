import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: dotenv.env['API_KEY'] ?? 'API_URL not found',
      appId: dotenv.env['APP_ID'] ?? 'APP_ID not found',
      messagingSenderId:
          dotenv.env['MESSAGE_SENDER_ID'] ?? 'MESSAGE_SENDER_ID not found',
      projectId: dotenv.env['PROJECT_ID'] ?? 'PROJECT_ID not found',
    ),
  );
  // print('-- main: Firebase.initializeApp');
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
  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    _listenToFSRValue1();
    _listenToFSRValue2();
    _listenToFSRValue3();
  }

  void _listenToFSRValue1() {
    databaseReference.child('Sensor/FSR1').onValue.listen((event) {
      setState(() {
        sensorValue1 = (event.snapshot.value ?? 0) as double;
      });
    });
  }

  void _listenToFSRValue2() {
    databaseReference.child('Sensor/FSR2').onValue.listen((event) {
      setState(() {
        sensorValue2 = (event.snapshot.value ?? 0) as double;
      });
    });
  }

  void _listenToFSRValue3() {
    databaseReference.child('Sensor/FSR3').onValue.listen((event) {
      setState(() {
        sensorValue3 = (event.snapshot.value ?? 0) as double;
      });
    });
  }

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
                padding: const EdgeInsets.all(16.0),
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
                  duration: const Duration(seconds: 1),
                  subDivisionCircleColors: const Color(0xFFC41A3B),
                  divisionCircleColors: const Color(0xFF1B1F32),
                  fractionDigits: 2,
                  activeGaugeColor: const Color(0xFFC41A3B),
                  innerCirclePadding: 16.0,
                  unitOfMeasurement: "",
                  unitOfMeasurementTextStyle: const TextStyle(
                    color: Color(0xFFC41A3B),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  minMaxTextStyle: const TextStyle(
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
                padding: const EdgeInsets.all(16.0),
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
                  duration: const Duration(seconds: 1),
                  subDivisionCircleColors: const Color(0xFFC41A3B),
                  divisionCircleColors: const Color(0xFF1B1F32),
                  fractionDigits: 2,
                  activeGaugeColor: const Color(0xFFC41A3B),
                  innerCirclePadding: 16.0,
                  unitOfMeasurement: "",
                  unitOfMeasurementTextStyle: const TextStyle(
                    color: Color(0xFFC41A3B),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  minMaxTextStyle: const TextStyle(
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
                padding: const EdgeInsets.all(16.0),
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
                  duration: const Duration(seconds: 1),
                  subDivisionCircleColors: const Color(0xFFC41A3B),
                  divisionCircleColors: const Color(0xFF1B1F32),
                  fractionDigits: 2,
                  activeGaugeColor: const Color(0xFFC41A3B),
                  innerCirclePadding: 16.0,
                  unitOfMeasurement: "",
                  unitOfMeasurementTextStyle: const TextStyle(
                    color: Color(0xFFC41A3B),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  minMaxTextStyle: const TextStyle(
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
