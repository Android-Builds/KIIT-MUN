// // ignore_for_file: unused_local_variable

// import 'dart:async';

// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mun/ui/pages/announce.dart';
// import 'package:permission_handler/permission_handler.dart';

// import '../../../utils/constants.dart';
// import '../../widgets/connectInternet.dart';

// class CommitteLocation extends StatefulWidget {
//   CommitteLocation({Key? key}) : super(key: key);

//   @override
//   State<CommitteLocation> createState() => _CommitteLocationState();
// }

// class _CommitteLocationState extends State<CommitteLocation> {
//   late Connectivity connectivity;
//   bool isOffline = false;
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;

//   late GoogleMapController mapController;

//   final LatLng _center = const LatLng(45.521563, -122.677433);

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   void initState() {
//     connectivity = new Connectivity();
//     _connectivitySubscription =
//         connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
//       if (result == ConnectivityResult.wifi ||
//           result == ConnectivityResult.mobile) {
//         isOffline = false;
//         setState(() {});
//       } else {
//         isOffline = true;
//         setState(() {});
//       }
//     });
//     _marker.addAll(_list);
//     super.initState();
//   }

//   bool locationPerm = false;

//   locationPermission() async {
//     if (await Permission.location.request().isGranted) {
//       setState(() {
//         locationPerm = true;
//       });
//     } else {
//       setState(() {
//         locationPerm = false;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _connectivitySubscription.cancel();
//     super.dispose();
//   }

//   Completer<GoogleMapController> _controller = Completer();

//   static final CameraPosition _kGoogle = const CameraPosition(
//     target: LatLng(37.42796133580664, -122.885749655962),
//     zoom: 14.4746,
//   );

//   List<Marker> _marker = [];
//   final List<Marker> _list = const [
//     // List of Markers Added on Google Map
//     Marker(
//         markerId: MarkerId('1'),
//         position: LatLng(20.42796133580664, 80.885749655962),
//         infoWindow: InfoWindow(
//           title: 'My Position',
//         )),

//     Marker(
//         markerId: MarkerId('2'),
//         position: LatLng(25.42796133580664, 80.885749655962),
//         infoWindow: InfoWindow(
//           title: 'Location 1',
//         )),

//     Marker(
//         markerId: MarkerId('3'),
//         position: LatLng(20.42796133580664, 73.885749655962),
//         infoWindow: InfoWindow(
//           title: 'Location 2',
//         )),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     locationPermission();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Locations"),
//       ),
//       body: isOffline
//           ? Connect(size: size)
//           : GoogleMap(
//               onMapCreated: _onMapCreated,
//               initialCameraPosition: CameraPosition(
//                 target: _center,
//                 zoom: 11.0,
//               ),
//             ),
//       // ListView.builder(
//       //     controller: ScrollController(),
//       //     physics: BouncingScrollPhysics(),
//       //     padding: EdgeInsets.all(10.0),
//       //     itemCount: committeeNames.length,
//       //     itemBuilder: (context, index) {
//       //       return Padding(
//       //         padding: EdgeInsets.only(top: 20.0, left: 20, bottom: 20),
//       //         child: Column(
//       //           crossAxisAlignment: CrossAxisAlignment.start,
//       //           children: [
//       //             Text(
//       //               committeeNames[index],
//       //               style: TextStyle(
//       //                 fontSize: size.width * 0.04,
//       //                 fontWeight: FontWeight.bold,
//       //               ),
//       //             ),
//       //             Container(
//       //               height: 100,
//       //               width: size.width,
//       //               child: GoogleMap(
//       //                 onMapCreated: _onMapCreated,
//       //                 initialCameraPosition: CameraPosition(
//       //                   target: _center,
//       //                   zoom: 11.0,
//       //                 ),
//       //               ),
//       //             )
//       //           ],
//       //         ),
//       //       );
//       //     },
//       //   ),
//     );
//   }
// }
