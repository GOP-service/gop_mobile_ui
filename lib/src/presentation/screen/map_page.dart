import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:vietmap_flutter_gl/vietmap_flutter_gl.dart';

class MapPage extends StatefulWidget {
  const MapPage({required this.type, super.key});

  final String? type;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  VietmapController? _mapController;
  List<Marker> temp = [];
  UserLocation? userLocation;
  bool isVector = true;
  late RouteSimulator routeSimulator;
  Marker? _marker;
  LatLng? currentLatLng;
  String styleString =
      'https://maps.vietmap.vn/api/maps/light/styles.json?apikey=b00c56c4751ac6eb19dd72a48d9c8630d203e6aa8bbb104a';

  void _onMapCreated(VietmapController controller) {
    setState(() {
      _mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Map - ${widget.type ?? 'Normal'}'),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more))],
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
            if (userLocation != location) {
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
            _marker = Marker(
                child: const Icon(Icons.location_on, color: Colors.red),
                latLng: LatLng(coordinates.latitude, coordinates.longitude));
            developer.log('Mark Location: $coordinates');
          },
        ),
        _mapController != null
            ? MarkerLayer(markers: [
                _marker ??
                    Marker(
                      child: const Icon(Icons.location_on),
                      latLng: LatLng(10.739031, 106.680524),
                    )
              ], mapController: _mapController!)
            : const SizedBox()
      ]),
    );
  }
}
