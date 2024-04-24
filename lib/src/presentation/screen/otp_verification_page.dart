import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gop_driver/core/app_color.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({super.key});

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColor.lightGreyColor,
        elevation: 0,
        title: const Text('Verification',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset('assets/icons/Arrow-left.svg'),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20, bottom: 8),
            child: const Text(
              'Email verification',
              style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 32),
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 8,
              children: [
                Text(
                  'OTP Code sent to your email',
                  style: TextStyle(
                      color: AppColor.blackColor.withOpacity(0.7),
                      fontSize: 14),
                ),
                const SizedBox(width: 8),
                const Text(
                  'youremail@email.com',
                  style: TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          PinCodeTextField(
            appContext: (context),
            length: 6,
            onChanged: (value) {},
            obscureText: false,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderWidth: 1.5,
              borderRadius: BorderRadius.circular(8),
              fieldHeight: 48,
              fieldWidth: 48,
              activeColor: AppColor.primaryColor,
              selectedColor: AppColor.darkGreyColor,
              inactiveColor: AppColor.blackColor,
              inactiveFillColor: AppColor.blackColor,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: AppColor.primaryColor.withOpacity(0.1),
              ),
              child: Text(
                'Resend OTP Code !',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColor.blackColor.withOpacity(0.5),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 16),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageSwitcher()));
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                backgroundColor: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 0,
                shadowColor: Colors.transparent,
              ),
              child: const Text(
                'Verify',
                style: TextStyle(
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
