import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gop_mobile_ui/src/presentation/screen/gop_food/restaurantpickup_page.dart';
import 'package:gop_mobile_ui/src/presentation/screen/home_page.dart';
import 'package:gop_mobile_ui/src/presentation/screen/gop_food/restauranthome_page.dart';

import '../../../core/app_color.dart';

class GoPFoodPage extends StatefulWidget {
  const GoPFoodPage({super.key});

  @override
  State<GoPFoodPage> createState() => _GoPFoodState();
}

class _GoPFoodState extends State<GoPFoodPage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _pages = [
    RestaurantHomePage(),
    RestaurantPickupPage(),
    RestaurantHomePage(),
    HomePage(),
    RestaurantHomePage()
  ];
  List<Map<String, String>> lstBottomItem = [
    {'name': 'Khám phá', 'url': 'assets/icons/Compass.svg'},
    {'name': 'Pickup', 'url': 'assets/icons/Tags.svg'},
    {'name': 'Tìm kiếm', 'url': 'assets/icons/Magnifying-glass.svg'},
    {'name': 'Ưu đãi', 'url': 'assets/icons/Percent.svg'},
    {'name': 'Đơn hàng', 'url': 'assets/icons/Bag-shopping.svg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: PageView(
                controller: _pageController,
                children: _pages,
                onPageChanged: _onPageChanged,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            for (var index = 0; index < lstBottomItem.length; index++)
              BottomNavigationBarItem(
                  icon: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          _selectedIndex == index
                              ? AppColor.primaryColor
                              : Colors.grey,
                          BlendMode.srcIn),
                      child: SvgPicture.asset(lstBottomItem[index]['url']!,
                          height: 16, width: 16)),
                  label: lstBottomItem[index]['name']!),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColor.primaryColor,
          onTap: _onItemTapped),
    );
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
    print("_onItemTapped $index");
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print("_onPageChanged $index");
  }
}
