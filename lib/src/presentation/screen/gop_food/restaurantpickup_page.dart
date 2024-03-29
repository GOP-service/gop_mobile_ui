import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gop_mobile_ui/core/app_color.dart';
import 'package:gop_mobile_ui/src/presentation/screen/gop_food/restaurant_page.dart';

class RestaurantPickupPage extends StatefulWidget {
  const RestaurantPickupPage({super.key});

  @override
  State<RestaurantPickupPage> createState() => _RestaurantPickupState();
}

class _RestaurantPickupState extends State<RestaurantPickupPage> {
  double height = 0;
  double width = 0;

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // centerTitle: true,
          title: _btnLocation("238A Hoàng Diệu 2"),
          backgroundColor: Colors.white,
          // elevation: 1,
          automaticallyImplyLeading: false,
        ),
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
                          SizedBox(height: height * 0.14, width: width),
                          _deliciousFood(),
                          const SizedBox(height: 20),
                          _imgAdvertisement(),
                          const SizedBox(height: 20),
                          _pickupRestaurant(),
                          const SizedBox(height: 20),
                          _btnViewAll(),
                          SizedBox(height: height * 0.1)
                        ])))));
  }

  Widget _btnLocation(String location) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Row(
                children: [
                  const Text("Vị trí của bạn",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(width: 5),
                  _imgSVG('assets/icons/Chevron-down.svg', 12, 12, Colors.red),
                ],
              ),
              Text(location,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w800))
            ])));
  }

  Widget _deliciousFood() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: const Text("Danh mục món ngon mời bạn chọn",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w900),
              softWrap: true)),
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
          _deliciousFoodButton(
              'assets/images/food_categories/com_nong_sot.png', "Cơm nóng sốt",
              isFirst: true),
          _deliciousFoodButton(
              'assets/images/food_categories/nong_hoi_xi_xup.png',
              "Nóng hổi xì xụp"),
          _deliciousFoodButton(
              'assets/images/food_categories/banh_mi_ngon.png', "Bánh mì ngon"),
          _deliciousFoodButton(
              'assets/images/food_categories/my_vi_hai_san.png',
              "Mỹ vị hải sản"),
          _deliciousFoodButton(
              'assets/images/food_categories/thuc_an_nhanh.png',
              "Thức ăn nhanh"),
          _deliciousFoodButton(
              'assets/images/food_categories/tra_sua_ngot.png', "Trà sữa ngọt"),
        ]));
  }

  Widget _deliciousFoodButton(String url, String name, {bool isFirst = false}) {
    return Container(
        margin: isFirst ? EdgeInsets.only(left: 0) : EdgeInsets.only(left: 15),
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

  Widget _imgAdvertisement() {
    return SizedBox(
        height: height * 0.24,
        width: width * 0.9,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
                "https://pano.vn/wp-content/uploads/2021/05/quang-cao-xe-buyt-cho-go-viet-9.jpg",
                fit: BoxFit.cover)));
  }

  Widget _pickupRestaurant() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
          width: width * 0.9,
          child: const Text("Quán Pickup gần bạn",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
              softWrap: true)),
      SizedBox(
          width: width * 0.9,
          child: Text("Loạt quán xá đỉnh của chóp trong khu vực",
              style: TextStyle(color: Colors.grey.shade800, fontSize: 14),
              softWrap: true)),
      _lstPickupRestaurant()
    ]);
  }

  Widget _lstPickupRestaurant() {
    return Column(children: [
      _pickupRestaurantButton(
          "https://images.foody.vn/res/g100004/1000036006/prof/s320x200/file_cbe81e3d-853c-4bd7-992e-38e-e727b23b-211029172830.jpeg",
          "Kampri Secret, Đặng Thùy Trâm",
          "Thức Ăn Nhanh, Cà Phê Đỉnh, Sinh tố Healthy",
          0.3),
      _pickupRestaurantButton(
          "https://images.foody.vn/res/g106/1056218/prof/s1242x600/foody-upload-api-foody-mobile-foody-upload-api-foo-201118133730.jpg",
          "OLA Ngon Nha - Trà & Trà Sữa Dương Quảng Hàm",
          "Trà Sữa Ngọt, Ngọt Gây Nghiện",
          0.8),
      _pickupRestaurantButton(
          "https://images.foody.vn/res/g104/1030524/prof/s/foody-upload-api-foody-mobile-54b6451b67cb9s995c0d-201026093905.jpg",
          "Trà Sữa Oilto Milktea, Dương Quảng Hàm",
          "Trà Sữa Ngọt, Ngọt Gây Nghiện",
          0.8),
      _pickupRestaurantButton(
          "https://cdn.tgdd.vn/2021/02/CookProduct/thumbcmscn-1200x676-19.jpg",
          "Cơm Gà Ta - Gỏi Gà Ta Ngũ Sắc, Nguyễn Xí",
          "Ngon Chuẩn Việt",
          0.8),
      _pickupRestaurantButton(
          "https://cdn.tgdd.vn/2021/05/CookProduct/thum-1-1200x676-12-1200x676.jpg",
          "Bún Thịt Nướng - Bánh Cuốn & Bánh Ướt Thịt Nướng 24H, Nguyễn Xí",
          "Ngon Chuẩn Việt, Thức Ăn Nhanh, Cơm Nóng Sốt",
          0.8),
    ]);
  }

  Widget _pickupRestaurantButton(
      String url, String title, String categories, double gap) {
    return GestureDetector(
      onTap: () {
        // Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RestaurantPage()));
      },
      child: Container(
          height: height * 0.1,
          width: width * 0.9,
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Row(children: [
            _imgButton(url),
            const Spacer(),
            Column(children: [
              _txtOverflowButton(title, FontWeight.w800, 16, Colors.black),
              _txtOverflowButton(
                  categories, FontWeight.normal, 13, Colors.grey.shade800),
              const Spacer(),
              _txtOverflowButton(
                  "$gap km", FontWeight.normal, 13, Colors.grey.shade800),
            ])
          ])),
    );
  }

  Widget _imgButton(String url) {
    return SizedBox(
        height: height * 0.1,
        width: width * 0.25,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(url, fit: BoxFit.cover)));
  }

  Widget _txtOverflowButton(
      String content, FontWeight fw, double fs, Color color) {
    return SizedBox(
        width: width * 0.6,
        child: Text(content,
            style: TextStyle(color: color, fontSize: fs, fontWeight: fw),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false));
  }

  Widget _btnViewAll() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            fixedSize: Size(width * 0.9, width * 0.15),
            side: const BorderSide(color: AppColor.primaryColor, width: 2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.075)),
            padding: const EdgeInsets.all(0)),
        onPressed: () {},
        child: const Text("Xem Tất Cả",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor)));
  }

  Widget _imgSVG(String url, double widthSize, double heightSize, Color color) {
    return ColorFiltered(
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        child: SvgPicture.asset(url, width: widthSize, height: heightSize));
  }

  void _setDimension() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        width = MediaQuery.of(context).size.width;
        height = MediaQuery.of(context).size.height;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _setDimension();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
