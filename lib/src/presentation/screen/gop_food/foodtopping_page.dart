import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:gop_mobile_ui/core/app_color.dart';
import 'package:intl/intl.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({super.key});

  @override
  State<FoodDetailPage> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetailPage> {
  double height = 0;
  double width = 0;

  double originPrice = 47000;
  double toppingPrice = 47000;
  double finalPrice = 47000;

  int count = 1;

  List<bool> lstItemStatus = [];

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          // extendBodyBehindAppBar: true,

          appBar: AppBar(
            // centerTitle: true,
            title: const Text("Tùy chỉnh món ăn",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.white,
            // elevation: 1,
          ),
          body: FormBuilder(
            key: _formKey,
            child: Container(
                color: Colors.grey.shade100,
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height),
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [_foodTitle(), _toppingSection(), _note()]))),
          ),
          bottomNavigationBar: _footer(),
        ));
  }

  Widget _foodTitle() {
    return Container(
      width: width,
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 2)),
      ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
            width: width * 0.7,
            child: const Text("Cơm Gà Sốt Chua Cay Size Nhỏ",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false)),
        Text(NumberFormat.decimalPattern().format(originPrice).toString(),
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black))
      ]),
    );
  }

  Widget _toppingSection() {
    return Container(
        width: width,
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
        margin: const EdgeInsets.only(bottom: 3),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 2)),
        ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              width: width,
              child: const Text("CHỌN TOPPING",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))),
          _lstTopping()
        ]));
  }

  Widget _lstTopping() {
    return Column(children: [
      _toppingItem(0, "Canh rong biển thanh mát", 18000),
      _toppingItem(1, "Canh cải chua thịt bằm", 20000, isStock: false),
      _toppingItem(2, "Canh khổ qua nhồi thịt", 22000),
      _toppingItem(3, "Chả hấp", 18000),
      _toppingItem(4, "Trứng ốp la", 13000),
      _toppingItem(5, "Cải chua", 13000, isStock: false),
      _toppingItem(6, "Khăn lạnh", 13000),
      _toppingItem(7, "Dụng cụ ăn uống", 10000, isLast: true),
    ]);
  }

  Widget _toppingItem(int index, String name, double price,
      {bool isStock = true, bool isLast = false}) {
    lstItemStatus.add(false);
    return Container(
        decoration: BoxDecoration(
            border: isLast
                ? null
                : const Border(
                    bottom: BorderSide(color: Colors.grey, width: 1.0))),
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(name,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isStock ? Colors.black : Colors.grey))),
            SizedBox(
                child: isStock
                    ? Row(
                        children: [
                          Text(
                              NumberFormat.decimalPattern()
                                  .format(price)
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 8),
                          Checkbox(
                            value: lstItemStatus[index],
                            activeColor: AppColor.primaryColor,
                            onChanged: (bool? value) {
                              setState(() {
                                lstItemStatus[index] = value!;
                                if (lstItemStatus[index]) {
                                  toppingPrice += price;
                                  finalPrice = toppingPrice * count;
                                } else {
                                  toppingPrice -= price;
                                  finalPrice = toppingPrice * count;
                                }
                              });
                            },
                          )
                        ],
                      )
                    : Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: const Text("Hết món",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red)))),
          ],
        ));
  }

  Widget _footer() {
    return Container(
        height: height * 0.17,
        width: width,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3)),
        ]),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text("Số lượng món",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            Row(children: [_btnMinus(), _txtCount(), _btnPlus()])
          ]),
          _btnAdd()
        ]));
  }

  Widget _btnMinus() {
    return IconButton(
        icon: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: (count < 2) ? Colors.grey : AppColor.primaryColor,
                    width: 2)),
            child: _imgSVG('assets/icons/Minus.svg', 20, 20,
                (count < 2) ? Colors.grey : AppColor.primaryColor)),
        onPressed: () {
          if (count > 1) {
            setState(() {
              count--;
              finalPrice = toppingPrice * count;
            });
          }
        });
  }

  Widget _btnAdd() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            fixedSize: Size(width * 0.9, width * 0.1),
            // side: const BorderSide(color: AppColor.primaryColor, width: 2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.075)),
            padding: const EdgeInsets.all(0)),
        onPressed: () {},
        child: Text(
            "Thêm vào giỏ hàng - ${NumberFormat.decimalPattern().format(finalPrice)}",
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white)));
  }

  Widget _txtCount() {
    return Text(count.toString(),
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold));
  }

  Widget _btnPlus() {
    return IconButton(
        icon: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.primaryColor, width: 2)),
            child: _imgSVG(
                'assets/icons/Plus.svg', 20, 20, AppColor.primaryColor)),
        onPressed: () {
          setState(() {
            count++;
            finalPrice = toppingPrice * count;
          });
        });
  }

  Widget _note() {
    return Container(
        width: width,
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Ghi chú",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          _noteTextBox(),
          SizedBox(height: height * 0.08)
        ]));
  }

  Widget _noteTextBox() {
    return FormBuilderTextField(
        name: 'note',
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade50,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: AppColor.primaryColor)),
            hintText: "Ví dụ: Không cay",
            prefixIcon: Container(
                margin: const EdgeInsets.all(10),
                child:
                    _imgSVG('assets/icons/File-lines.svg', 0, 0, Colors.grey)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 25)),
        style: const TextStyle(fontSize: 16),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: FormBuilderValidators.compose([]));
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
    // _scrollController.addListener(_printColor);
  }

  @override
  void dispose() {
    // _scrollController.removeListener(_printColor);
    // _scrollController.dispose();
    super.dispose();
  }
}
