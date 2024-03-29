import 'package:flutter/material.dart';
import 'package:gop_mobile_ui/src/presentation/screen/gopfood_page.dart';
import 'package:gop_mobile_ui/src/presentation/screen/gop_food/restauranthome_page.dart';

import '../../../core/app_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Widget'),
      ),
      body:  Center(
        child:
        // Text('Hello, World!'),
        ElevatedButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GoPFoodPage()));} , 
          child: Text("Go food",style: TextStyle(color: AppColor.primaryColor),),))
      );
  }
}