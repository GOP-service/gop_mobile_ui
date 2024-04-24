import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gop_passenger/core/app_color.dart';
import 'package:gop_passenger/core/app_icon.dart';
import 'package:gop_passenger/src/presentation/component/driver_order_failed_widget.dart';
import 'package:gop_passenger/src/presentation/component/svg_image_widget.dart';

class DriverOrderWaiting extends StatefulWidget {
  const DriverOrderWaiting({Key? key}) : super(key: key);

  @override
  _DriverOrderWaitingState createState() => _DriverOrderWaitingState();
}

class _DriverOrderWaitingState extends State<DriverOrderWaiting> {
  // Dimension
  late double width;
  late double height;

  //Timer
  int minutes = 0;
  int seconds = 0;
  late Timer timer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: width,
            height: height,
            color: Colors.black.withOpacity(0.5),
          ),
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
                _btnBack(),
                Center(
                    child: Column(children: [
                  const Spacer(),
                  SvgImageWidget(
                      url: AppIcon.icMotorcycle,
                      heightSize: width * 0.3,
                      widthSize: width * 0.3,
                      color: AppColor.primaryColor),
                  const SizedBox(height: 10),
                  Text(
                    timerString,
                    style: TextStyle(fontSize: 48.0),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Vui lòng chờ tài xế",
                    style:
                        TextStyle(fontSize: 22, color: AppColor.primaryColor),
                  ),
                  const Spacer(),
                ])),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _btnBack() {
    return Positioned(
      top: 20,
      right: 20,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.close),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds == 59) {
          seconds = 0;
          if (minutes == 0) {
            timer.cancel();
            Navigator.pop(context);
            Navigator.of(context).push(PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) {
                  return const AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: 1.0, // Độ mờ 80%
                    child: DriverOrderFailed(),
                  );
                }));
          } else {
            minutes--;
          }
        } else {
          seconds++;
        }
      });
    });
  }

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

  String get timerString {
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
