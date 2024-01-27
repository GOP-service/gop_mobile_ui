import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gop_mobile_ui/core/app_color.dart';
import 'package:gop_mobile_ui/src/presentation/screen/signup_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});


  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
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
        title: const Text('Sign in', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
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
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignupPage()));
          },
          style: TextButton.styleFrom(
            foregroundColor: AppColor.primaryColor.withOpacity(0.1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dont have an account?',
                style: TextStyle(
                  color: AppColor.primaryColor.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                ' Sign up',
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
              'Welcome Back Mate ! 😁',
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
          // Section 2 - Form
          // Email
          TextField(
            autofocus: false,
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
              fillColor: AppColor.lightGreyColor,
              filled: true,
            ),
          ),
          const SizedBox(height: 16),
          // Password
          TextFormField(
            autofocus: false,
            obscureText: _isObscure,
            decoration: InputDecoration(
              hintText: '**********',
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
          // Forgot Passowrd
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: AppColor.primaryColor.withOpacity(0.1),
              ),
              child: Text(
                'Forgot Password ?',
                style: TextStyle(fontSize: 12, color: AppColor.blackColor.withOpacity(0.5), fontWeight: FontWeight.w700),
              ),
            ),
          ),
          // Sign In button
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageSwitcher()));
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18), backgroundColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
            child: const Text(
              'Sign in',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18, fontFamily: 'nunito'),
            ),
          ),
        ],
      ),
    );
  }
}
