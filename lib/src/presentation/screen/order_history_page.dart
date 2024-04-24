import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:gop_passenger/core/app_color.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Order History',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Kiểu chữ đậm
              fontSize: 25,
            ),
          ),
          backgroundColor: Colors.white // Đặt màu nền xanh
          ),
      // backgroundColor: Colors.green[300], // Sử dụng màu cam nhạt từ palette của Flutter
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(
              color: AppColor.blackColor,
              thickness: BorderSide.strokeAlignCenter,
            ),
            OderHistoryCardItem(
              dropoffAddress:
                  'Trường đại học sư phạm kỹ thuật Thành Phố Hồ Chí Minh',
              orderTime: '2021-10-10 10:10:10',
              tripFare: '100000',
            ),
            OderHistoryCardItem(
              dropoffAddress: 'cafe izy',
              orderTime: '2021-10-10 10:10:10',
              tripFare: '24000',
            ),
            OderHistoryCardItem(
              dropoffAddress: 'sân bay Tân Sơn Nhất',
              orderTime: '2021-10-10 10:10:10',
              tripFare: '53000',
            ),
          ],
        ),
      ),
    );
  }
}

class OderHistoryCardItem extends StatelessWidget {
  const OderHistoryCardItem({
    super.key,
    required this.dropoffAddress,
    required this.orderTime,
    required this.tripFare,
  });

  final String dropoffAddress;
  final String orderTime;
  final String tripFare;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/orders/orderhistoryitem');
      },
      customBorder: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 360,
        // padding: EdgeInsets.all(10), // Thêm padding cho Container
        child: Row(
          children: <Widget>[
            Flexible(
              child: Card(
                margin: const EdgeInsets.all(4.0),
                surfaceTintColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10), // Thêm padding cho Text
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  Icon(
                                    Icons.motorcycle, // Icon bạn muốn sử dụng
                                    color: Colors.green, // Màu của icon
                                  ),
                                  SizedBox(
                                      width:
                                          5), // Khoảng cách giữa icon và text
                                  Expanded(
                                    child: Text(
                                      dropoffAddress,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow
                                          .ellipsis, // Ẩn một phần của văn bản và hiển thị dấu ba chấm khi quá dài
                                      maxLines: 1, // Chỉ hiển thị một dòng
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: 5), // Thêm khoảng cách giữa hai Text

                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time, // Icon bạn muốn sử dụng
                                    color: Colors.orange, // Màu của icon
                                  ),
                                  SizedBox(
                                      width:
                                          5), // Khoảng cách giữa icon và text
                                  Text(
                                    orderTime,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "$tripFare VND",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
