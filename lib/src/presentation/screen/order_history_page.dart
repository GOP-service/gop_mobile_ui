import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        backgroundColor: Colors.greenAccent, // Đặt màu nền xanh
        centerTitle: true, // Căn giữa tiêu đề trên AppBar

      ),
      // backgroundColor: Colors.green[300], // Sử dụng màu cam nhạt từ palette của Flutter
      backgroundColor: Colors.greenAccent,
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            OderHistoryCardItem(
              dropoffAddress: 'Trường đại học sư phạm kỹ thuật Thành Phố Hồ Chí Minh',
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
      child: SizedBox(
        width: 360,
        // padding: EdgeInsets.all(10), // Thêm padding cho Container
        child: Row(
          children: <Widget>[
            Flexible(
              child: Card(
                // color: Colors.orange[400],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10,
                                top: 10,
                                bottom: 10,
                                right: 10), // Thêm padding cho Text
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Icon(
                                      Icons.motorcycle, // Icon bạn muốn sử dụng
                                      color: Colors.green, // Màu của icon
                                    ),
                                    SizedBox(width: 5), // Khoảng cách giữa icon và text
                                    Expanded(
                                      child: Text(
                                        dropoffAddress,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis, // Ẩn một phần của văn bản và hiển thị dấu ba chấm khi quá dài
                                        maxLines: 1, // Chỉ hiển thị một dòng
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5), // Thêm khoảng cách giữa hai Text

                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time, // Icon bạn muốn sử dụng
                                      color: Colors.orange, // Màu của icon
                                    ),
                                    SizedBox(width: 5), // Khoảng cách giữa icon và text
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

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
