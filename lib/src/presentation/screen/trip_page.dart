import 'package:flutter/material.dart';
import 'package:gop_passenger/core/app_color.dart';
import 'package:gop_passenger/src/presentation/component/rate_trip.dart';
import 'package:vietmap_flutter_gl/vietmap_flutter_gl.dart';
import 'dart:math' as math;
import 'dart:developer' as developer;

import 'package:vietmap_flutter_plugin/vietmap_flutter_plugin.dart';

class TripPage extends StatefulWidget {
  const TripPage({required this.type, super.key});

  final String? type;

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> with TickerProviderStateMixin {
  VietmapController? _mapController;
  List<Marker> temp = [];
  UserLocation? userLocation;
  bool isVector = true;
  late RouteSimulator routeSimulator;
  Marker? _marker;
  Marker? _dropoffMarker;

  LatLng? currentLatLng;
  String styleString =
      'https://maps.vietmap.vn/api/maps/light/styles.json?apikey=b00c56c4751ac6eb19dd72a48d9c8630d203e6aa8bbb104a';

  // Bottom Navigation Bar
  bool _isPickup = true;
  String _pickupLocation = "";
  String _dropoffLocation = "";
  double _gap = 0;
  bool isCompleted = false;
  // Dimension
  double width = 0;
  double height = 0;

  void _onMapCreated(VietmapController controller) {
    setState(() {
      _mapController = controller;
    });
  }

  bool isMoved(LatLng current, LatLng last) {
    if (roundToFive(current.latitude) == roundToFive(last.latitude) &&
        roundToFive(current.longitude) == roundToFive(last.longitude))
      return true;
    else
      return false;
  }

  double roundToFive(double value) {
    double mod = math.pow(10.0, 6).toDouble();
    return ((value * mod).round().toDouble() / mod);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(        
          title: Text('Map',style: TextStyle(color: Colors.white)),
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.primaryColor.withOpacity(0.7),
          // actions: [
          //   IconButton(
          //       onPressed: () async {
          //         // await _locationBottomSheet();
          //       },
          //       icon: const Icon(Icons.more))
          // ],
          centerTitle: true),
      body: Stack(children: [
        VietmapGL(
          myLocationEnabled: true,
          myLocationTrackingMode: MyLocationTrackingMode.Tracking,
          myLocationRenderMode: MyLocationRenderMode.COMPASS,
          styleString: styleString,
          trackCameraPosition: true,
          onMapCreated: _onMapCreated,
          onUserLocationUpdated: (location) {
            if (isMoved(userLocation!.position, location.position)) {
              setState(() {
                userLocation = location;
                _mapController?.animateCamera(
                    CameraUpdate.newLatLngZoom(location.position, 15.0));
                developer.log('user Location: ${location.position}');
              });
            }
          },
          initialCameraPosition: CameraPosition(
              target:
                  userLocation?.position ?? const LatLng(10.739031, 106.680524),
              zoom: 15),
          onMapClick: (point, coordinates) async {
            if (_isPickup) {
              _marker = Marker(
                  child: const Icon(Icons.location_on, color: Colors.red),
                  latLng: LatLng(coordinates.latitude, coordinates.longitude));
              await _getMarkerAddress(_marker!.latLng);
            } else {
              _dropoffMarker = Marker(
                  child: const Icon(Icons.location_on, color: Colors.blue),
                  latLng: LatLng(coordinates.latitude, coordinates.longitude));
              await _getMarkerAddress(_dropoffMarker!.latLng);
              // await _setGapAndPrice();
            }

            // await _locationBottomSheet();
            developer.log('Mark Location: $coordinates');
          },
        ),
        _mapController != null
            ? MarkerLayer(markers: [
                _marker ??
                    Marker(
                      child: const Icon(Icons.location_on),
                      latLng: LatLng(10.739031, 106.680524),
                    ),
                _dropoffMarker ??
                    Marker(
                      child: const Icon(Icons.location_on),
                      latLng: LatLng(10.739031, 106.680524),
                    )
              ], mapController: _mapController!)
            : const SizedBox(),
        Positioned(bottom: 20, left: 10, right: 10, child: _btnCompleted())
      ]),
    );
  }

  Future<void> _getMarkerAddress(LatLng latLng) async {
    var result = await Vietmap.reverse(latLng);
    result.fold(
      (failure) {
        print("Đã xảy ra lỗi: $failure");
      },
      (address) {
        setState(() {
          if (_isPickup) {
            _pickupLocation = address.display!;
          } else {
            _dropoffLocation = address.display!;
          }
        });
      },
    );
  }

  void _setDimension() {
    setState(() {
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
    });
  }

  @override
  void initState() {
    Vietmap.getInstance('b00c56c4751ac6eb19dd72a48d9c8630d203e6aa8bbb104a');
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setDimension();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _btnCompleted() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            fixedSize: Size(width * 0.9, width * 0.1),
            // side: const BorderSide(color: AppColor.primaryColor, width: 2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.075)),
            padding: const EdgeInsets.all(0)),
        onPressed: () {
          Navigator.pop(context);
          Navigator.of(context).push(PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: 1.0, // Độ mờ 80%
                  child: RatingScreen(),
                );
              }));
          //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TripPage(type: '')));
        },
        child: Text("Hoàn thành chuyến đi",
            style: TextStyle(
                fontSize: width * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.white)));
  }
}
