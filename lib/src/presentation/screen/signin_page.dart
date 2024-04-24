import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gop_driver/core/app_color.dart';
import 'package:gop_driver/src/bloc/auth/auth_bloc.dart';
import 'package:gop_driver/src/data/repository/auth_repository.dart';
import 'package:gop_driver/src/presentation/widgets/loading_overlay.dart';
import "dart:developer" as developer;

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool _isObscure = true;
  final _emailController = TextEditingController(text: 'phcnguyenba@gmail.com');
  final _passwordController = TextEditingController(text: 'string');

  @override
  void initState() {
    super.initState();
    developer.log("Trying to refresh token. 1");
    context.read<AuthBloc>().add(AuthStarted());
    // context.read<AuthRepository>().refresh();
  }

  void _toggle() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          Loader.show(context);
        } else if (state is Authenticated) {
          context.go('/home');
          Loader.hide();
        } else if (state is Unauthenticated) {
          Loader.hide();
        } else if (state is AuthAuthenticateFailure) {
          Loader.hide();
          if (state.message.isNotEmpty == true) {
            context
                .read<AuthBloc>()
                .add(ShowSnackBar(context: context, message: state.message));
          }
        }
      },
      child: Scaffold(
          bottomNavigationBar: Container(
            width: MediaQuery.of(context).size.width,
            height: 48,
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                context.push('/signup');
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
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(color: AppColor.primaryColor),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/icons/Bg.svg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 80),
                      child: SvgPicture.asset('assets/icons/Logo.svg'),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.blackColor.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 10),
                            ),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(32)),
                        ),
                        child: _signInForm(
                            context, _emailController, _passwordController)),
                  ),
                  const Expanded(child: SizedBox.expand()),
                ],
              ),
            ],
          )),
    );
  }

  Column _signInForm(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) {
    final emailController0 = emailController;
    final passwordController0 = passwordController;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          flex: 2,
          child: Container(
            alignment: Alignment.topCenter,
            child: const Text(
              'Sign in',
              style: TextStyle(color: AppColor.blackColor, fontSize: 24),
            ),
          ),
        ),
        // Email
        Flexible(
          flex: 2,
          child: TextFormField(
            controller: emailController0,
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'youremail@email.com',
              prefixIcon: Container(
                margin: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Message.svg'),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColor.blackColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColor.primaryColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: AppColor.lightGreyColor,
              filled: true,
            ),
          ),
        ),
        const Spacer(),
        // Password
        Flexible(
          flex: 2,
          child: TextFormField(
            controller: passwordController0,
            autofocus: false,
            obscureText: _isObscure,
            decoration: InputDecoration(
                hintText: '**********',
                prefixIcon: Container(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/Lock.svg'),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColor.blackColor, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColor.primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: AppColor.lightGreyColor,
                filled: true,
                //
                suffixIcon: IconButton(
                    onPressed: () {
                      _toggle();
                    },
                    icon: SvgPicture.asset(_isObscure
                        ? 'assets/icons/Hide.svg'
                        : 'assets/icons/Show.svg'))),
          ),
        ),
        // Forgot Passowrd
        Flexible(
          flex: 2,
          child: Container(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: AppColor.primaryColor.withOpacity(0.1),
              ),
              child: Text(
                'Forgot Password ?',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColor.blackColor.withOpacity(0.5),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        // Sign In button
        Flexible(
          flex: 2,
          fit: FlexFit.loose,
          child: ElevatedButton(
            onPressed: () {
              if (emailController0.text.isEmpty ||
                  passwordController0.text.isEmpty) {
                context.read<AuthBloc>().add(
                    ShowSnackBar(context: context, message: 'Fill all fields'));
                return;
              }
              context.read<AuthBloc>().add(AuthSigninStarted(
                  email: emailController0.text,
                  password: passwordController0.text));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
            child: const Text(
              'Sign in',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  fontFamily: 'nunito'),
            ),
          ),
        ),
      ],
    );
  }
}
