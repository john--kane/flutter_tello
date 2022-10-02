import 'package:flutter/material.dart';
import 'package:flutter_tello/api/enums.dart';
import 'package:flutter_tello/api/tello_state.dart';
import 'package:flutter_tello/flutter_tello.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  Tello drone = Tello(configuration: TelloConfiguration());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => drone.setup(),
            icon: const Icon(Icons.connecting_airports)),
        title: const Text("Flutter Tello Demo"),
        actions: [
          IconButton(
              onPressed: () => drone.destroy(),
              icon: const Icon(Icons.disc_full))
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<Tello>(
            future: drone.setup(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView(
                children: [
                  StreamBuilder<TelloState>(
                      stream: drone.state,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return const Text("TEST");
                        } else if (snapshot.hasError) {
                          return const Icon(Icons.error_outline);
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: const Text(
                      "Lift off",
                    ),
                    onTap: () => drone.sendCommand(TakeOffCommand()),
                  ),
                  ListTile(
                    title: const Text("Land"),
                    onTap: () => drone.sendCommand(LandCommand()),
                  ),
                  ListTile(
                    title: const Text("Emergency"),
                    onTap: () => drone.sendCommand(EmergencyCommand()),
                  ),
                  ListTile(
                    title: const Text("Flip"),
                    onTap: () =>
                        drone.sendCommand(FlipCommand(FlipDirection.back)),
                  ),
                  ListTile(
                    title: const Text("Fly To Position"),
                    onTap: () => drone.sendCommand(FlyToPositionCommand()),
                  ),
                  ListTile(
                    title: const Text("Curve To Position"),
                    onTap: () => drone.sendCommand(CurveToPositionCommand()),
                  ),
                  ListTile(
                    title: const Text("Rotate Left"),
                    onTap: () => drone.sendCommand(RotateCommand(
                        90, RotationalDirection.counter_clockwise)),
                  ),
                  ListTile(
                    title: const Text("Rotate Right"),
                    onTap: () => drone.sendCommand(
                        RotateCommand(90, RotationalDirection.clockwise)),
                  ),
                  ListTile(
                    title: const Text("Get Speed"),
                    onTap: () => drone.sendCommand(GetSpeedCommand()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
