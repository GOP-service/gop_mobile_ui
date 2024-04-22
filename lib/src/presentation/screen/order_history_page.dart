import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            OderHistoryCardItem(
              dropoffAddress: 'Trường ĐH SPKT TP.HCM',
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
                                Text(
                                  dropoffAddress,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        5), // Thêm khoảng cách giữa hai Text
                                Text(
                                  orderTime,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
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
