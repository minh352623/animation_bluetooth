// import 'package:flutter/material.dart';
// import 'package:flutter_blue/flutter_blue.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BluetoothScanner(),
//     );
//   }
// }

// class BluetoothScanner extends StatefulWidget {
//   @override
//   _BluetoothScannerState createState() => _BluetoothScannerState();
// }

// class _BluetoothScannerState extends State<BluetoothScanner> {
//   FlutterBlue flutterBlue = FlutterBlue.instance;
//   List<ScanResult> scanResults = [];

//   @override
//   void initState() {
//     super.initState();

//     flutterBlue.startScan(timeout: Duration(seconds: 4));

//     flutterBlue.scanResults.listen((results) {
//       setState(() {
//         scanResults = results;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     flutterBlue.stopScan();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bluetooth Scanner'),
//       ),
//       body: ListView.builder(
//         itemCount: scanResults.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(scanResults[index].device.name),
//             subtitle: Text(scanResults[index].device.id.toString()),
//           );
//         },
//       ),
//     );
//   }
// }
