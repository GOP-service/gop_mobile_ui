import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gop_mobile_ui/core/app_icon.dart';
import 'package:gop_mobile_ui/core/app_image.dart';

import '../../../../core/app_color.dart';

class RestaurantHomePage extends StatefulWidget {
  const RestaurantHomePage({super.key});

  @override
  State<RestaurantHomePage> createState() => _RestaurantHomeState();
}

class _RestaurantHomeState extends State<RestaurantHomePage> {
  double height = 0;
  double width = 0;

  int currentAdsPage = 0;

  // ignore: unused_field
  int _selectedIndex = 0;

  List<Widget> imageSliders = [];
  List<String> urlSliders = [
    "https://pano.vn/wp-content/uploads/2021/05/quang-cao-xe-buyt-cho-go-viet-9.jpg",
    "https://amis.misa.vn/wp-content/uploads/2022/11/chien-luoc-marketing-cua-gojek-6.jpg",
    "https://gofood.vn/upload/r/slider/gofood-tang-30k-banner-mobile.jpg",
    "https://azgroup.net.vn/wp-content/uploads/2020/03/quang-cao-go-viet-cho-nha-hang-quan-an-1.jpeg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4iShCilsWm8H-cTQoycUaHiPBpJTMe3wrPQ&usqp=CAU",
  ];

  // ScrollController _scrollController = ScrollController();

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            // centerTitle: true,
            title: _btnLocation("238A Hoàng Diệu 2"),
            backgroundColor: Colors.transparent,
            // elevation: 1,
            leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_btnBack()]),
            actions: [_btnFavorites()]),
        body: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
              // controller: _scrollController,
              scrollDirection: Axis.vertical,
              child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _bodyHeader(),
                      const SizedBox(height: 20),
                      Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _btnInteractive(
                                    AppIcon.icCirclePlus, 'GoPFood', 'Plus'),
                                _btnInteractive(
                                    AppIcon.icPercent, 'Tất cả', 'Ưu đãi'),
                                _btnInteractive(
                                    AppIcon.icTags, 'GoPFood', 'Pickup')
                              ])),
                      const SizedBox(height: 20),
                      _discountButtons(8),
                      const SizedBox(height: 20),
                      _famousBrand(),
                      const SizedBox(height: 20),
                      _deliciousFood(),
                      const SizedBox(height: 20),
                      _suggestFood(),
                      const SizedBox(height: 40),
                    ],
                  ))),
        ));
  }

  Widget _btnBack() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(0.0)),
      onPressed: () {
        Navigator.pop(context);
      },
      child: SvgPicture.asset(AppIcon.icXmark, width: 24, height: 24),
    );
  }

  Widget _btnLocation(String location) {
    return IntrinsicWidth(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0)),
                backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
                padding: const EdgeInsets.all(10.0)),
            onPressed: () {
              // Navigator.pop(context);
            },
            child: Row(
              children: [
                _imgSVG(AppIcon.icLocationDot, 24, 24, Colors.white),
                const SizedBox(width: 10),
                Text(location, style: const TextStyle(color: Colors.white))
              ],
            )));
  }

  Widget _btnFavorites() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(0.0)),
        onPressed: () {
          // Navigator.pop(context);
        },
        child: SvgPicture.asset(AppIcon.icHeart, width: 20, height: 20));
  }

  Widget _bodyHeader() {
    return Stack(
      children: [
        Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            height: height * 0.31,
            width: width),
        _advertisementImages(),
        Positioned(
            top: width * 0.45,
            right: 0,
            left: 0,
            child: _advertisementIndicators()),
        Positioned(
            bottom: 0, right: 0, left: 0, child: Center(child: _searchBox())),
      ],
    );
  }

  Widget _advertisementImages() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 16 / 9,
        viewportFraction: 1.0,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 500),
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          setState(() {
            currentAdsPage = index;
          });
        },
      ),
      items: imageSliders,
    );
  }

  Widget _advertisementIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imageSliders.map((item) {
        int index = imageSliders.indexOf(item);
        return Container(
          width: currentAdsPage == index ? 30.0 : 10.0,
          height: 10.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white),
        );
      }).toList(),
    );
  }

  Widget _searchBox() {
    return Container(
        width: width * 0.9,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3))
            ]),
        child: Row(children: [
          const SizedBox(width: 15),
          _imgSVG(AppIcon.icMagnifyingGlass, 20, 20, Colors.black),
          const SizedBox(width: 10),
          const Text("Bạn đang thèm món gì", style: TextStyle(fontSize: 18)),
          const Spacer(),
          _imgSVG(AppIcon.icSpoon, 20, 20, Colors.red),
          const SizedBox(width: 15),
        ]));
  }

  Widget _btnInteractive(String url, String note, String name) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          // elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          fixedSize: Size(width * 0.27, height * 0.13),
          // shadowColor: Colors.black,
          side: const BorderSide(
              color: Colors.grey, // Border color
              width: 2),
        ),
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            ClipOval(child: _imgSVG(url, 30, 30, Colors.red)),
            Expanded(
                child: Text(note,
                    style: const TextStyle(color: Colors.grey, fontSize: 13))),
            Expanded(
                child: Text(name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w900))),
            const Spacer(),
          ],
        ));
  }

  Widget _imgSVG(String url, double widthSize, double heightSize, Color color) {
    return ColorFiltered(
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        child: SvgPicture.asset(url, width: widthSize, height: heightSize));
  }

  Widget _discountButtons(int discount) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            padding: const EdgeInsets.all(15),
            fixedSize: Size(width * 0.9, height * 0.1),
            side: const BorderSide(
                color: Colors.grey, // Border color
                width: 2)),
        onPressed: () {},
        child: Row(children: [
          Expanded(
              child: Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.all(5),
                  padding: EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.yellow),
                  child: _imgSVG(AppIcon.icTicket, 24, 24, Colors.red))),
          Expanded(
              flex: 2,
              child: Text('Bạn có $discount ưu đãi',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold))),
          const Spacer(),
          _imgSVG(AppIcon.icCircleArrowRight, 24, 24, Colors.red),
          const SizedBox(width: 5)
        ]));
  }

  Widget _famousBrand() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("Thương hiệu nổi bật",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w900)),
      const SizedBox(height: 10),
      SizedBox(
          height: width * 0.52,
          width: width * 0.9,
          child: _lstFamousBrandButton())
    ]);
  }

  Widget _lstFamousBrandButton() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        _famousBrandButton(
            AppImage.imgMiTronSaTeHuyMap, "Mì Trộn Sa Tế Huy Mập",
            isFirst: true),
        _famousBrandButton(AppImage.imgLotteria, "Lotteria"),
        _famousBrandButton(AppImage.imgTutimi, "Tutimi"),
        _famousBrandButton(
            AppImage.imgComTamPhucLocTho, "Cơm Tấm Phúc Lộc Thọ"),
        _famousBrandButton(AppImage.imgHongTrNgoGia, "Hồng Trà Ngô Gia"),
      ]),
    );
  }

  Widget _famousBrandButton(String url, String name, {bool isFirst = false}) {
    return Container(
        margin: isFirst ? EdgeInsets.only(left: 0) : EdgeInsets.only(left: 15),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: Size(width * 0.33, width * 0.48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.all(0)),
            onPressed: () {},
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(url,
                        height: width * 0.33,
                        width: width * 0.33,
                        fit: BoxFit.cover)),
                Container(
                    margin: const EdgeInsets.only(top: 5),
                    width: width * 0.3,
                    child: Text(name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        softWrap: true))
              ],
            )));
  }

  Widget _btnViewAll() {
    return IntrinsicWidth(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0)),
                backgroundColor: Color.fromARGB(255, 147, 255, 219),
                padding: const EdgeInsets.all(10.0)),
            onPressed: () {
              // Navigator.pop(context);
            },
            child: const Text('Xem tất cả',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 186, 124)))));
  }

  Widget _deliciousFood() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(
          width: width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: width * 0.55,
                  child: const Text("Danh mục món ngon mời bạn chọn",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w900),
                      softWrap: true)),
              _btnViewAll()
            ],
          )),
      const SizedBox(height: 10),
      SizedBox(
          height: width * 0.33,
          width: width * 0.9,
          child: _lstDeliciousFoodButton())
    ]);
  }

  Widget _lstDeliciousFoodButton() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          _deliciousFoodButton(AppImage.imgComNongSot, "Cơm nóng sốt",
              isFirst: true),
          _deliciousFoodButton(AppImage.imgNongHoiXiXup, "Nóng hổi xì xụp"),
          _deliciousFoodButton(AppImage.imgBanhMiNgon, "Bánh mì ngon"),
          _deliciousFoodButton(AppImage.imgMyViHaiSan, "Mỹ vị hải sản"),
          _deliciousFoodButton(AppImage.imgThucAnNhanh, "Thức ăn nhanh"),
          _deliciousFoodButton(AppImage.imgTraSuaNgot, "Trà sữa ngọt"),
        ]));
  }

  Widget _deliciousFoodButton(String url, String name, {bool isFirst = false}) {
    return Container(
        margin: EdgeInsets.only(left: isFirst ? 0 : 15),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: Size(width * 0.3, width * 0.3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.all(0)),
            onPressed: () {},
            child: Column(
              children: [
                const SizedBox(height: 5),
                Container(
                    width: width * 0.15,
                    height: width * 0.15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 0.5)),
                    child:
                        ClipOval(child: Image.asset(url, fit: BoxFit.cover))),
                Container(
                    margin: const EdgeInsets.only(top: 5),
                    width: width * 0.24,
                    child: Text(name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        softWrap: true,
                        textAlign: TextAlign.center))
              ],
            )));
  }

  Widget _suggestFood() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: width * 0.9),
        const Text("Thêm gợi ý để bạn chọn",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w800)),
        const SizedBox(height: 3),
        Text("Toàn món tuyển, đảm bảo bạn sẽ mê!",
            style: TextStyle(color: Colors.grey.shade800, fontSize: 14)),
        const SizedBox(height: 15),
        _lstSuggestFoodButton()
      ],
    );
  }

  Widget _lstSuggestFoodButton() {
    return Column(
      children: [
        _suggestFoodButton(
            "https://cdn.tgdd.vn/Files/2020/11/28/1310002/no-cang-bung-voi-5-quan-com-tam-ngon-quen-loi-ve-o-phu-nhuan-202011281558471729.jpg",
            "Cơm Tấm Tài - Nguyễn Văn Nghi",
            "Ngon Chuẩn Việt, Cơm Nóng Sốt",
            4.4,
            28,
            1.92),
        _suggestFoodButton(
            "https://images.foody.vn/res/g116/1154064/prof/s1242x600/foody-upload-api-foody-mobile-ho-a0adf1d8-221023022200.jpeg",
            "Hồng Trà Ngô Gia, 181 Nguyễn Gia Trí",
            "Trà Sữa Ngọt, Ngọt Gây Nghiện",
            4.8,
            29,
            3.05),
        _suggestFoodButton(
            "https://www.foodandwine.com/thmb/zaL9eyOyTgCjX99DFOhB3iG7YEk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/The-Worst-Time-to-Visit-McDonalds-FT-BLOG0823-711a27313d1a448baf4db4817310ff5d.jpg",
            "McDonald's, Đa Kao",
            "Menu Có Cánh, Thức Ăn Nhanh",
            4.5,
            32,
            4.28)
      ],
    );
  }

  Widget _suggestFoodButton(String url, String foodName, String foodCategory,
      double rate, double time, double gap) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: width * 0.9,
          height: height * 0.35,
          margin: const EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.orange.shade100),
          child: Column(
            children: [
              Stack(children: [
                Container(
                    width: width * 0.9,
                    height: height * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 0))
                        ]),
                    child: Column(children: [
                      _imgFoodButton(url),
                      _foodInformation(foodName, foodCategory),
                    ])),
                Positioned(
                    top: height * 0.195,
                    left: 20,
                    child: Row(children: [
                      _rating(rate),
                      const SizedBox(width: 10),
                      _delivery(time, gap)
                    ]))
              ]),
              _txtDiscountFood("Giảm 10%, tối đa 30k")
            ],
          )),
    );
  }

  Widget _rating(double rate) {
    return IntrinsicWidth(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: AppColor.primaryColor),
            padding: const EdgeInsets.all(1.0),
            child: Row(
              children: [
                const SizedBox(width: 6),
                _imgSVG(AppIcon.icStar, 10, 10, Colors.white),
                const SizedBox(width: 6),
                Text(rate.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                const SizedBox(width: 6),
              ],
            )));
  }

  Widget _delivery(double time, double gap) {
    return IntrinsicWidth(
        child: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(35.0)),
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(35.0),
                            bottomLeft: Radius.circular(35.0)),
                        color: Colors.grey.shade300),
                    padding: const EdgeInsets.all(1.0),
                    child: Row(children: [
                      const SizedBox(width: 6),
                      _imgSVG(AppIcon.icMotorcycle, 13, 13,
                          Colors.grey.shade900),
                      const SizedBox(width: 6),
                      Text("$time phút",
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.w800)),
                      const SizedBox(width: 6)
                    ])),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(35),
                          bottomRight: Radius.circular(35)),
                      color: Colors.grey.shade100),
                  padding: const EdgeInsets.only(
                      top: 1.0, bottom: 1.0, left: 6.0, right: 6.0),
                  child: Text("$gap km",
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 12)),
                )
              ],
            )));
  }

  Widget _imgFoodButton(String url) {
    return Align(
        alignment: Alignment.topCenter, // or Alignment.topLeft
        child: Container(
            width: width * 0.9,
            height: height * 0.21,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(url, fit: BoxFit.cover))));
  }

  Widget _foodInformation(String foodName, String fodCategory) {
    return Container(
        width: width * 0.9,
        padding: const EdgeInsets.only(top: 10, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(foodName,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w800)),
            const SizedBox(height: 1),
            Text(fodCategory,
                style: TextStyle(color: Colors.grey.shade800, fontSize: 14)),
            const SizedBox(height: 15)
          ],
        ));
  }

  Widget _txtDiscountFood(String discount) {
    return Container(
      width: width * 0.9,
      padding: const EdgeInsets.only(top: 7, left: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imgSVG(AppIcon.icPercent, 20, 20, Colors.red),
          const SizedBox(width: 7),
          Text(discount,
              style: const TextStyle(
                  color: Colors.red, fontSize: 15, fontWeight: FontWeight.w800))
        ],
      ),
    );
  }

  Widget _imgSlider(String url) {
    return ClipRRect(
        child: Image.network(url,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity));
  }

  void _addAdvertiseImage() {
    for (int i = 0; i < urlSliders.length; i++) {
      imageSliders.add(_imgSlider(urlSliders[i]));
    }
  }

  void _setDimension() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        width = MediaQuery.of(context).size.width;
        height = MediaQuery.of(context).size.height;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // void _printColor() {
  //   double offset = _scrollController.offset;
  // }

  @override
  void initState() {
    super.initState();
    _setDimension();
    _addAdvertiseImage();
    // _scrollController.addListener(_printColor);
  }

  @override
  void dispose() {
    // _scrollController.removeListener(_printColor);
    // _scrollController.dispose();
    super.dispose();
  }
}
