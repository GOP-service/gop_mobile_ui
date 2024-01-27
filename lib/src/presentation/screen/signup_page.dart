import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gop_mobile_ui/core/app_color.dart';
import 'package:gop_mobile_ui/src/presentation/screen/otp_verification_page.dart';
import 'package:gop_mobile_ui/src/presentation/screen/signin_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SignupPage> {
  bool _isObscure = true;

  void _toggle() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColor.lightGreyColor,
        elevation: 0,
        title: const Text('Sign up', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset('assets/icons/Arrow-left.svg'),
        ), systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SigninPage()));
          },
          style: TextButton.styleFrom(
            foregroundColor: AppColor.primaryColor.withOpacity(0.1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: TextStyle(
                  color: AppColor.primaryColor.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                ' Sign in',
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Header
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 12),
            child: const Text(
              'Welcome to GOP  👋',
              style: TextStyle(
                color: AppColor.blackColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 32),
            child: Text(
              'Hi, nice to meet you!',
              style: TextStyle(color: AppColor.blackColor.withOpacity(0.7), fontSize: 12, height: 150 / 100),
            ),
          ),
          // Section 2  - Form
          // Full Name
          TextField(
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'Full Name',
              prefixIcon: Container(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Profile.svg',),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.blackColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.primaryColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: AppColor.lightGreyColor.withOpacity(0.1),
              filled: true,
            ),
          ),
          const SizedBox(height: 16),
          // Username
          // TextField(
          //   autofocus: false,
          //   decoration: InputDecoration(
          //     hintText: 'Username',
          //     prefixIcon: Container(
          //       padding: const EdgeInsets.all(12),
          //       child: const Text('@', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: AppColor.blackColor)),
          //     ),
          //     contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          //     enabledBorder: OutlineInputBorder(
          //       borderSide: const BorderSide(color: AppColor.blackColor, width: 1),
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderSide: const BorderSide(color: AppColor.primaryColor, width: 1),
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //     fillColor: AppColor.lightGreyColor.withOpacity(0.1),
          //     filled: true,
          //   ),
          // ),
          // const SizedBox(height: 16),
          // Email
          TextField(
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'youremail@email.com',
              prefixIcon: Container(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Message.svg'),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.blackColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.primaryColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: AppColor.lightGreyColor.withOpacity(0.1),
              filled: true,
            ),
          ),
          const SizedBox(height: 16),
          // Password
          TextField(
            autofocus: false,
            obscureText: _isObscure,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: Container(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Lock.svg',),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.blackColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.primaryColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: AppColor.lightGreyColor,
              filled: true,
              //
              suffixIcon: IconButton(
                onPressed: () {
                  _toggle();
                },
                icon: SvgPicture.asset(_isObscure ? 'assets/icons/Hide.svg' : 'assets/icons/Show.svg')
              )
            ),
          ),
          const SizedBox(height: 16),
          // Repeat Password
          TextField(
            autofocus: false,
            obscureText: _isObscure,
            decoration: InputDecoration(
              hintText: 'Repeat Password',
              prefixIcon: Container(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Lock.svg'),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.blackColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.primaryColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: AppColor.lightGreyColor,
              filled: true,
              //
              suffixIcon: IconButton(
                onPressed: () {
                  _toggle();
                },
                icon: SvgPicture.asset(_isObscure ? 'assets/icons/Hide.svg' : 'assets/icons/Show.svg')
              )
            ),
          ),
          const SizedBox(height: 24),
          // Sign Up Button
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OTPVerificationPage()));
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18), backgroundColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
            child: const Text(
              'Sign up',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
          // Container(
          //   alignment: Alignment.center,
          //   margin: const EdgeInsets.symmetric(vertical: 16),
          //   child: Text(
          //     'or continue with',
          //     style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          //   ),
          // ),
          // SIgn in With Google
          // ElevatedButton(
          //   onPressed: () {},
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       SvgPicture.asset(
          //         'assets/icons/Google.svg',
          //       ),
          //       Container(
          //         margin: EdgeInsets.only(left: 16),
          //         child: Text(
          //           'Continue with Google',
          //           style: TextStyle(
          //             color: AppColor.primaryColor,
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          //   style: ElevatedButton.styleFrom(
          //     foregroundColor: AppColor.primaryColor, padding: EdgeInsets.symmetric(horizontal: 36, vertical: 12), backgroundColor: AppColor.primarySoft,
          //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          //     elevation: 0,
          //     shadowColor: Colors.transparent,
          //   ),
          // ),
        ],
      ),
    );
  }
}
