import 'package:flutter/material.dart';
import 'package:flutter_tello/api/enums.dart';
import 'package:flutter_tello/api/tello_state.dart';
import 'package:flutter_tello/flutter_tello.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late Tello drone = Tello(configuration: TelloConfiguration());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => drone.setup(), icon: Icon(Icons.connecting_airports)),
        title: Text("Flutter Tello Demo"),
        actions: [IconButton(onPressed: () => drone.destroy(), icon: Icon(Icons.disc_full))],
      ),
      body: SafeArea(
        child: FutureBuilder<Tello>(
            future: drone.setup(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              // return Center(
              //   child: StreamBuilder(
              //       stream: drone.rawDataStream,
              //       builder: (BuildContext context, AsyncSnapshot snapshot) {
              //         if (snapshot.hasData) {
              //           return Text("TEST");
              //         } else if (snapshot.hasError) {
              //           return Icon(Icons.error_outline);
              //         } else {
              //           return CircularProgressIndicator();
              //         }
              //       }),
              // );
              return ListView(
                children: [
                  StreamBuilder<TelloState>(
                      stream: drone.state,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return Text("TEST");
                        } else if (snapshot.hasError) {
                          return Icon(Icons.error_outline);
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text(
                      "Lift off",
                    ),
                    onTap: () => drone.sendCommand(TakeOffCommand()),
                  ),
                  ListTile(
                    title: Text("Land"),
                    onTap: () => drone.sendCommand(LandCommand()),
                  ),
                  ListTile(
                    title: Text("Emergency"),
                    onTap: () => drone.sendCommand(EmergencyCommand()),
                  ),
                  ListTile(
                    title: Text("Flip"),
                    onTap: () => drone.sendCommand(FlipCommand(FlipDirection.back)),
                  ),
                  ListTile(
                    title: Text("Fly To Position"),
                    onTap: () => drone.sendCommand(FlyToPositionCommand()),
                  ),
                  ListTile(
                    title: Text("Curve To Position"),
                    onTap: () => drone.sendCommand(CurveToPositionCommand()),
                  ),
                  ListTile(
                    title: Text("Rotate Left"),
                    onTap: () => drone.sendCommand(RotateCommand(90, RotationalDirection.counter_clockwise)),
                  ),
                  ListTile(
                    title: Text("Rotate Right"),
                    onTap: () => drone.sendCommand(RotateCommand(90, RotationalDirection.clockwise)),
                  ),
                  ListTile(
                    title: Text("Get Speed"),
                    onTap: () => drone.sendCommand(GetSpeedCommand()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
