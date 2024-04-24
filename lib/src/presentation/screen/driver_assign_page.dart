import 'package:flutter/material.dart';
import 'package:gop_passenger/core/app_color.dart';
import 'package:gop_passenger/src/presentation/component/network_image_widget.dart';
import 'package:gop_passenger/src/presentation/screen/trip_page.dart';
import 'package:gop_passenger/src/presentation/state/payment_method.dart';

class DriverAssignPage extends StatefulWidget {
  const DriverAssignPage({required this.type, super.key});

  final String? type;

  @override
  State<DriverAssignPage> createState() => _DriverAssignState();
}

class _DriverAssignState extends State<DriverAssignPage>
    with TickerProviderStateMixin {
  // Dimension
  double width = 0;
  double height = 0;

  //Driver
  String _driverName = "";
  String _driverPhone = "";
  String _driverVehicleId = "";

  //Trip
  String _pickupAddress = "";
  String _dropoffAddress = "";
  double _price = 0;
  PaymentMethod? _paymentMethod;

  //Customer
  bool _isCancel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        title:
            const Text("Driver Assign", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(15),
        color: Colors.white,
        child: SingleChildScrollView(
            child: Column(
          children: [
            _driverInformation(),
            const Divider(thickness: 1.5),
            _tripInformation(),
            const SizedBox(height: 50),
            _actionButton()
          ],
        )),
      ),
    );
  }

  Widget _driverInformation() {
    return Row(
      children: [
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(_driverName,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          Text(_driverPhone, style: const TextStyle(fontSize: 17)),
          Text(_driverVehicleId, style: const TextStyle(fontSize: 17)),
        ])),
        SizedBox(width: 15),
        ClipOval(
            child: NetworkImageWidget(
                url:
                    "https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png",
                heightSize: width * 0.25,
                widthSize: width * 0.25,
                color: null))
      ],
    );
  }

  Widget _tripInformation() {
    return Container(
        padding: EdgeInsets.all(15),
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(25)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("PICKUP",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(_pickupAddress,
              style: const TextStyle(fontSize: 18, color: Colors.black)),
          const SizedBox(height: 5),
          const Text("DROFF-OFF",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(_dropoffAddress,
              style: const TextStyle(fontSize: 18, color: Colors.black)),
          Row(children: [
            const Expanded(
                child: Text("Thanh toán:",
                    style: TextStyle(fontSize: 17, color: Colors.green))),
            Expanded(
                child: Text(
                    "${_price} VND (${_paymentMethod.toString().split('.').last})",
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.green,
                        fontWeight: FontWeight.bold)))
          ])
        ]));
  }

  Widget _actionButton() {
    if (!_isCancel) {
      return _btnApply();
    } else {
      return _btnCancel();
    }
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
        onPressed: () {
          setState(() {
            _isCancel =  !_isCancel;
          });
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TripPage(type: '')));
        },
        child: Text("Đã lên xe",
            style: TextStyle(
                fontSize: width * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.white)));
  }

  Widget _btnCancel() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            fixedSize: Size(width * 0.9, width * 0.1),
            // side: const BorderSide(color: AppColor.primaryColor, width: 2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.075)),
            padding: const EdgeInsets.all(0)),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("Hủy yêu cầu",
            style: TextStyle(
                fontSize: width * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.white)));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setDimension();
    });
    _setDriverInformation();
    _setTripInformation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   _setDimension();
  // }

  void _setDimension() {
    setState(() {
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
    });
  }

  void _setDriverInformation() {
    setState(() {
      _driverName = "Nguyễn Văn A";
      _driverPhone = "1234567890";
      _driverVehicleId = "59B - 26548";
    });
  }

  void _setTripInformation() {
    setState(() {
      _pickupAddress =
          "Số 1 Võ Văn Ngân. phường Linh Chiểu, thành phố Thủ Đức, Thành phố Hồ Chí Minh";
      _dropoffAddress =
          "Số 39 Tô Ngọc Vân, phương Linh Trung, thành phố Thủ Đức, Thành phố Hồ Chí Minh";
      _paymentMethod = PaymentMethod.cash;
      _price = 55000;
    });
  }
}
