import 'package:flutter/material.dart';
import 'package:gop_passenger/core/app_color.dart';
import 'package:gop_passenger/core/app_icon.dart';
import 'package:gop_passenger/src/presentation/component/svg_image_widget.dart';
import 'package:gop_passenger/src/presentation/screen/driver_assign_page.dart';

class DriverOrderCancel extends StatefulWidget {
  const DriverOrderCancel({Key? key}) : super(key: key);

  @override
  _DriverOrderCancelState createState() => _DriverOrderCancelState();
}

class _DriverOrderCancelState extends State<DriverOrderCancel> {
  // Dimension
  late double width;
  late double height;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setDimension();
  }

  void _setDimension() {
    setState(() {
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DriverAssignPage(type: '')));
        },
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              color: Colors.black.withOpacity(0.5),
            ),
            Center(
              child: Container(
                width: width * 0.85,
                height: height * 0.85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    Center(
                        child: Column(children: [
                      const Spacer(),
                      SvgImageWidget(
                          url: AppIcon.icMotorcycle,
                          heightSize: width * 0.3,
                          widthSize: width * 0.3,
                          color: Colors.red),
                      const SizedBox(height: 10),
                      const Text(
                        "Tài xế đã hủy chuyến,",
                        style: TextStyle(
                            fontSize: 22, color: AppColor.primaryColor),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "phiền ban gửi lại yêu cầu",
                        style: TextStyle(
                            fontSize: 22, color: AppColor.primaryColor),
                      ),
                      const Spacer(),
                    ])),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
