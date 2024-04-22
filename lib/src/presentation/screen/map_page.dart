import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:gop_passenger/core/app_color.dart';
import 'package:gop_passenger/core/app_icon.dart';
import 'package:gop_passenger/src/presentation/component/svg_image_widget.dart';
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

  // Bottom Navigation Bar
  String sourceLocation = "";
  String desLocation = "";

  // Dimension
  double width = 0;
  double height = 0;

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

  void _locationBottomSheet() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
                width: width,
                constraints: BoxConstraints(maxHeight: height * 0.35),
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: Column(children: [
                  Container(
                      height: 6,
                      width: 50,
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(3))),
                  _addressField(
                      "PICKUP",
                      sourceLocation,
                      SvgImageWidget(
                          color: Colors.red,
                          url: AppIcon.icLocationCrosshairs,
                          heightSize: width * 0.07,
                          widthSize: width * 0.07)),
                  _addressField(
                      "DROP-OFF",
                      desLocation,
                      SvgImageWidget(
                          color: Colors.green,
                          url: AppIcon.icLocationDot,
                          heightSize: width * 0.07,
                          widthSize: width * 0.07)),
                  const Spacer(),
                  _btnApply(),
                  const SizedBox(height: 25)
                ]));
          });
    });
  }

  Widget _addressField(String title, String content, Widget widget) {
    return Row(children: [
      SizedBox(
          width: width * 0.15,
          height: width * 0.15,
          child: Center(child: widget)),
      const SizedBox(width: 10),
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _addressName(title),
        const SizedBox(height: 10),
        _addressContent(content == "" ? "My curent location" : content),
        Container(
          color: Colors.grey,
          width: width * 0.7,
          height: 1.5,
        )
      ]))
    ]);
  }

  Widget _addressName(String txt) {
    return Text(txt, style: const TextStyle(fontSize: 18, color: Colors.grey));
  }

  Widget _addressContent(String txt) {
    return Text(txt,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 24));
  }

  void _setDimension() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        width = MediaQuery.of(context).size.width;
        height = MediaQuery.of(context).size.height;
      });
    });
  }

  Widget _btnApply() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            fixedSize: Size(width * 0.9, width * 0.1),
            // side: const BorderSide(color: AppColor.primaryColor, width: 2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.075)),
            padding: const EdgeInsets.all(0)),
        onPressed: () {},
        child: Text("Đặt",
            style: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.bold,
                color: Colors.white)));
    ;
  }

  @override
  void initState() {
    super.initState();
    _setDimension();
    _locationBottomSheet();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
