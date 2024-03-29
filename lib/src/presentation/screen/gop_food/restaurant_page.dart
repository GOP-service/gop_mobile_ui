import 'package:flutter/material.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantState();
}

class _RestaurantState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // centerTitle: true,
          // title: _btnLocation("238A Hoàng Diệu 2"),
          backgroundColor: Colors.white,
          // elevation: 1,
          automaticallyImplyLeading: false,
        ));
  }
}