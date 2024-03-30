import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gop_mobile_ui/core/app_color.dart';
import 'package:intl/intl.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantState();
}

class _RestaurantState extends State<RestaurantPage> {
  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: _appbarTitle("Cơm Gà Đệ Nhất, Lê Văn Việt"),
          actions: [_btnSearch(), _btnShare(), _btnInformation()],
          leading: _btnBack(),
          // bottom: PreferredSize(
          //   preferredSize: Size.fromHeight(24), // Chiều cao của hàng thứ 2
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: Text('Title của hàng thứ hai', style: TextStyle(fontSize: 12)),
          //   ),
          // ),
        ),
        body: Stack(children: [
          Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              child: SingleChildScrollView(
                  // controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        _restaurantInformation(),
                        const SizedBox(height: 10),
                        _restaurantAvanced(),
                        Container(
                            width: width,
                            color: Colors.grey.shade100,
                            child: Column(children: [
                              _categorySection(),
                              _categorySection(),
                              _categorySection(),
                              _categorySection()
                            ]))
                      ]))),
          Positioned(
              bottom: 20, left: 0, right: 0, child: Center(child: _btnMenu()))
        ]));
  }

  Widget _btnBack() {
    return IconButton(
      icon: _imgSVG(
          "assets/icons/Arrow-left-2.svg", 20, 20, Colors.grey.shade700),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _btnSearch() {
    return IconButton(
      icon: _imgSVG(
          "assets/icons/Magnifying-glass.svg", 20, 20, Colors.grey.shade700),
      onPressed: () {
        // Navigator.pop(context);
      },
    );
  }

  Widget _btnInformation() {
    return IconButton(
      icon:
          _imgSVG("assets/icons/Circle-info.svg", 20, 20, Colors.grey.shade700),
      onPressed: () {
        // Navigator.pop(context);
      },
    );
  }

  Widget _btnShare() {
    return IconButton(
      icon:
          _imgSVG("assets/icons/Share-nodes.svg", 20, 20, Colors.grey.shade700),
      onPressed: () {
        // Navigator.pop(context);
      },
    );
  }

  Widget _appbarTitle(String content) {
    return SizedBox(
        width: width * 0.6,
        child: Text(content,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false));
  }

  Widget _btnMenu() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35.0)),
            backgroundColor: Colors.red,
            fixedSize: Size(100, 40),
            padding: EdgeInsets.all(0.0)),
        onPressed: () {},
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _imgSVG("assets/icons/Bell-concierge.svg", 24, 24, Colors.white),
          const SizedBox(width: 5),
          Text("Menu", style: TextStyle(color: Colors.white, fontSize: 16))
        ]));
  }

  Widget _restaurantInformation() {
    return Container(
      width: width * 0.9,
      height: width * 0.15,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              _restaurantName("Cơm Gà Đệ Nhất, Lê Văn Việt"),
              _restaurantCategories("Cơm Nóng Sốt, Ngon Chuẩn Việt")
            ])),
        _restaurantAvatar(
            "https://images.foody.vn/res/g107/1062396/s800/foody-com-ga-de-nhat-le-van-viet-131-637500162223544525.jpg")
      ]),
    );
  }

  Widget _restaurantName(String name) {
    return Text(name,
        style: const TextStyle(
            color: Colors.black, fontSize: 19, fontWeight: FontWeight.w800),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        softWrap: false);
  }

  Widget _restaurantCategories(String categories) {
    return Text(categories,
        style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        softWrap: false);
  }

  Widget _restaurantAvatar(String url) {
    return Container(
        height: width * 0.15,
        width: width * 0.15,
        margin: const EdgeInsets.only(left: 10),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(url, fit: BoxFit.cover)));
  }

  Widget _restaurantAvanced() {
    return Container(
        height: height * 0.12,
        width: width,
        color: Colors.grey.shade50,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              _advancedItem("assets/icons/Star.svg", "Xem đánh giá",
                  4.8.toString(), const Color.fromARGB(255, 255, 81, 0),
                  isFirst: true),
              _advancedItem("assets/icons/Location-dot.svg", "Khoảng cách",
                  "0.61 km", Colors.red),
              _advancedItem(null, "Mức giá", "\$\$\$\$", null)
            ])));
  }

  Widget _advancedItem(
      String? url, String description, String title, Color? color,
      {bool isFirst = false}) {
    return Container(
        width: width * 0.4,
        height: height * 0.08,
        decoration: BoxDecoration(
            border: isFirst
                ? null
                : Border(
                    left: BorderSide(width: 1.5, color: Colors.grey.shade300))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (url != null)
                      ? _imgSVG(url, 16, 16, color!)
                      : const SizedBox(),
                  const SizedBox(width: 3),
                  Text(title.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))
                ]),
            Text(description,
                style: TextStyle(
                    color:
                        isFirst ? AppColor.primaryColor : Colors.grey.shade500,
                    fontSize: 15))
          ],
        ));
  }

  Widget _categorySection() {
    return Container(
        width: width,
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _categoryName("CƠM GÀ SIZE NHỎ"),
          _foodSection(
              "Cơm Gà Xốt Chua Cay Size Nhỏ",
              "Da gà giòn được xối lên một lớp mỡ ăn kèm nước mứm đậm đà, hấp dẫn đúng y vị gà xối mỡ từ những ngày đầu",
              "https://images.foody.vn/res/g107/1062396/s800/foody-com-ga-de-nhat-le-van-viet-131-637500162223544525.jpg",
              47000),
          _foodSection(
              "Cơm Gà Xốt Tiêu Xanh Size Nhỏ",
              "Da gà giòn được xối lên một lớp mỡ ăn kèm nước mứm đậm đà, hấp dẫn đúng y vị gà xối mỡ từ những ngày đầu",
              "https://images.foody.vn/res/g107/1062396/s800/foody-com-ga-de-nhat-le-van-viet-131-637500162223544525.jpg",
              48000),
          _foodSection(
              "Cơm Gà Xốt Mắm tỏi Size Nhỏ",
              "Da gà giòn được xối lên một lớp mỡ ăn kèm nước mứm đậm đà, hấp dẫn đúng y vị gà xối mỡ từ những ngày đầu",
              "https://images.foody.vn/res/g107/1062396/s800/foody-com-ga-de-nhat-le-van-viet-131-637500162223544525.jpg",
              52000)
        ]));
  }

  Widget _categoryName(String name) {
    return Text(name,
        style: const TextStyle(
            color: Colors.black, fontSize: 19, fontWeight: FontWeight.w800));
  }

  Widget _foodSection(String name, String bio, String url, double price) {
    return Column(children: [
      const SizedBox(height: 15),
      Row(children: [
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              _txtFoodName(name),
              _txtBio(bio),
              _txtPrice(price)
            ])),
        _imgFood(url)
      ]),
      const SizedBox(height: 10),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_btnSave(), _btnAdd()]),
      const SizedBox(height: 15),
      Container(height: 1, width: width, color: Colors.grey.shade300),
    ]);
  }

  Widget _imgFood(String url) {
    return Container(
        height: width * 0.15,
        width: width * 0.15,
        margin: const EdgeInsets.only(left: 10),
        child: ClipOval(child: Image.network(url, fit: BoxFit.cover)));
  }

  Widget _txtFoodName(String name) {
    return Text(name,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold));
  }

  Widget _txtBio(String bio) {
    return Text(bio,
        style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        softWrap: false);
  }

  Widget _txtPrice(double price) {
    return Text(NumberFormat.decimalPattern().format(price).toString(),
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold));
  }

  Widget _imgSVG(String url, double widthSize, double heightSize, Color color) {
    return ColorFiltered(
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        child: SvgPicture.asset(url, width: widthSize, height: heightSize));
  }

  Widget _btnSave() {
    return IconButton(
      icon: _imgSVG("assets/icons/Heart-2.svg", 24, 24, Colors.grey.shade700),
      onPressed: () {
        // Navigator.pop(context);
      },
    );
  }

  Widget _btnAdd() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35.0)),
            backgroundColor: Colors.white,
            fixedSize: const Size(70, 20),
            padding: const EdgeInsets.all(0.0),
            side: const BorderSide(color: AppColor.primaryColor, width: 1.5)),
        onPressed: () {},
        child: const Text("Thêm",
            style: TextStyle(color: AppColor.primaryColor, fontSize: 14)));
  }

  void _setDimension() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        this.width = MediaQuery.of(context).size.width;
        this.height = MediaQuery.of(context).size.height;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _setDimension();
    // _scrollController.addListener(_printColor);
  }

  @override
  void dispose() {
    // _scrollController.removeListener(_printColor);
    // _scrollController.dispose();
    super.dispose();
  }
}
