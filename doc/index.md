# flutter_tello

flutter_tello is a package for those wanting to control their Tello. The example folder has some basic example.

It is written in dart and depends on the rxdart and udp packages for simple binding and event publishing.

## Features

Send basic commands to your Tello.

Based of version 2.0 of the Tello SDK, found here: [https://dl-cdn.ryzerobotics.com/downloads/Tello/Tello%20SDK%202.0%20User%20Guide.pdf]

## Getting started

Create an instance of Tello

Tello drone = Tello(configuration: TelloConfiguration());

The default configuration will set the ports and default destination ip’s of the Tello. e.g. IP: “192.168.10.1", Receive Port = 8890, Send Port = 8889,

%% N.B. Video streaming coming soon

Call the setup method to create a UDP socket and start listening on the TelloConfigration() ports.

## Usage

Since the setup() is asynchronous, you should wrap it in a FutureBuilder or add it to an main() async function. The setup method will also send the ‘command’ command, so you don’t need to.

Once it is setup, you can then send commands to your Tello. This package follows the command pattern so every command you can send is wrapped in a command class.

e.g.
drone.sendCommand(TakeOffCommand())

## Additional information

Documentation on the different commands etc, coming soon.
