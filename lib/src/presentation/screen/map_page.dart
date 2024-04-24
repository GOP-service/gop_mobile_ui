import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:gop_passenger/core/app_color.dart';
import 'package:gop_passenger/core/app_icon.dart';
import 'package:gop_passenger/src/presentation/component/color_filtered_svg_image.dart';
import 'package:gop_passenger/src/presentation/component/driver_order_waiting_widget.dart';
import 'package:gop_passenger/src/presentation/component/payment_bottom_sheet.dart';
import 'package:gop_passenger/src/presentation/component/svg_image_widget.dart';
import 'package:gop_passenger/src/presentation/state/payment_method.dart';
import 'package:intl/intl.dart';
import 'package:vietmap_flutter_gl/vietmap_flutter_gl.dart';
import 'package:vietmap_flutter_plugin/vietmap_flutter_plugin.dart';
import 'dart:math' as math;

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
  Marker? _dropoffMarker;

  LatLng? currentLatLng;
  String styleString =
      'https://maps.vietmap.vn/api/maps/light/styles.json?apikey=b00c56c4751ac6eb19dd72a48d9c8630d203e6aa8bbb104a';

  // Bottom Navigation Bar
  bool _isPickup = true;
  String _pickupLocation = "";
  String _dropoffLocation = "";
  double _gap = 0;
  double _price = 0;
  double _invoice = 50000;
  PaymentMethod _paymentMethod = PaymentMethod.cash;
  String _txtMethod = "Tiền mặt";
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
      appBar: AppBar(
          title: Text('Map - ${widget.type ?? 'Normal'}'),
          actions: [
            IconButton(
                onPressed: () async {
                  await _locationBottomSheet();
                },
                icon: const Icon(Icons.more))
          ],
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
              await _setGapAndPrice();
              setState(() {
                isCompleted = true;
              });
            }

            await _locationBottomSheet();
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
            : const SizedBox()
      ]),
    );
  }

  Future<void> _locationBottomSheet() async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              width: width,
              // constraints: BoxConstraints(maxHeight: height * 0.35),
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
                    _pickupLocation,
                    SvgImageWidget(
                        color: Colors.red,
                        url: AppIcon.icLocationCrosshairs,
                        heightSize: width * 0.08,
                        widthSize: width * 0.08),
                    true),
                _addressField(
                    "DROP-OFF",
                    _dropoffLocation,
                    SvgImageWidget(
                        color: Colors.blue,
                        url: AppIcon.icLocationDot,
                        heightSize: width * 0.08,
                        widthSize: width * 0.08),
                    false),
                _payment(),
                const Spacer(),
                _btnApply(),
                const SizedBox(height: 25)
              ]));
        });
  }

  Widget _addressField(
      String title, String content, Widget widget, bool isPickup) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _isPickup = isPickup;
          });
          Navigator.pop(context);
        },
        child: Container(
            child: Row(children: [
          SizedBox(
              width: width * 0.15,
              height: width * 0.15,
              child: Center(child: widget)),
          const SizedBox(width: 10),
          Container(
              width: width * 0.7,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _addressName(title),
                    const SizedBox(height: 10),
                    _addressContent(
                        content == "" ? "My curent location" : content),
                    Container(
                      color: Colors.grey,
                      width: width * 0.7,
                      height: 1.5,
                    )
                  ]))
        ])));
  }

  Widget _addressName(String txt) {
    return Text(txt, style: const TextStyle(fontSize: 18, color: Colors.grey));
  }

  Widget _addressContent(String txt) {
    return Text(txt,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 20));
  }

  Widget _btnApply() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: isCompleted ? AppColor.primaryColor : Colors.grey,
            fixedSize: Size(width * 0.9, width * 0.1),
            // side: const BorderSide(color: AppColor.primaryColor, width: 2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.075)),
            padding: const EdgeInsets.all(0)),
        onPressed: () {
          if(isCompleted) {
            Navigator.of(context).push(PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return const AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: 1.0, // Độ mờ 80%
                  child: DriverOrderWaiting(),
                );
              }));
          }
        },
        child: (_gap != 0 && _price != 0)
            ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text("Gop - ${widget.type}",
                    style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Row(children: [
                  Text("${_gap} Km",
                      style: TextStyle(
                          fontSize: width * 0.035, color: Colors.white)),
                  const SizedBox(width: 5),
                  Text("${_price} VND",
                      style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ])
              ])
            : Text("Gop - ${widget.type}",
                style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)));
  }

  Widget _payment() {
    return GestureDetector(
        onTap: () async {
          await showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return PaymentBottomSheet(
                  onClosed: (PaymentMethod value) async {
                    setState(() {
                      _paymentMethod = value;
                    });
                    Navigator.pop(context);
                    // await _locationBottomSheet();
                  },
                );
              });
          _locationBottomSheet();
        },
        child: Container(
            width: width,
            margin: const EdgeInsets.all(10),
            color: Colors.transparent,
            child: Row(children: [
              imgPayment(),
              SizedBox(width: width * 0.1),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(_getPayTitle(),
                    style: const TextStyle(color: Colors.grey, fontSize: 14)),               
              ]),
            ])));
  }

  Widget imgPayment() {
    if (_paymentMethod == PaymentMethod.paypal) {
      return const ColorFilteredSvgImage(
          url: AppIcon.icCcPaypal, width: 24, height: 24, color: Colors.green);
    } else if (_paymentMethod == PaymentMethod.bankTransfer) {
      return const ColorFilteredSvgImage(
          url: AppIcon.icCreditCard,
          width: 24,
          height: 24,
          color: Colors.green);
    } else {
      return const ColorFilteredSvgImage(
          url: AppIcon.icMoneyBills,
          width: 24,
          height: 24,
          color: Colors.green);
    }
  }

  Widget _icEllipsis() {
    return Container(
        padding: EdgeInsets.all(3),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
        child: const ColorFilteredSvgImage(
            color: Colors.white,
            width: 16,
            height: 16,
            url: AppIcon.icEllipsis));
  }

  String _getPayTitle() {
    if (_paymentMethod == PaymentMethod.paypal) {
      return "Paypal";
    } else if (_paymentMethod == PaymentMethod.bankTransfer) {
      return "Chuyển khoản";
    } else {
      return "Tiền mặt";
    }
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

  Future<void> _setGapAndPrice() async {
    setState(() {
      _gap = 10.6589;
      _price = 116000;
    });
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
      _locationBottomSheet();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
