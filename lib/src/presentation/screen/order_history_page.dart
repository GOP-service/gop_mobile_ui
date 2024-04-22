import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 360,
              // padding: EdgeInsets.all(10), // Thêm padding cho Container
              child: const Row(
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
                                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10), // Thêm padding cho Text
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Trường Đại Học Sư Phạm Kỹ Thuật Thành Phố Hồ Chí Minh",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 5), // Thêm khoảng cách giữa hai Text
                                      Text(
                                        "1 thg 1 2024, 16:20",
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
                                "40.000đ" + "   ",
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

            Container(
              width: 360,
              // padding: EdgeInsets.all(10), // Thêm padding cho Container
              child: const Row(
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
                                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10), // Thêm padding cho Text
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Đường số 8, Linh Xuân, Thủ Đức",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 5), // Thêm khoảng cách giữa hai Text
                                      Text(
                                        "1 thg 1 2024, 16:20",
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
                                "40.000đ" + "   ",
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

            Container(
              width: 360,
              // padding: EdgeInsets.all(10), // Thêm padding cho Container
              child: const Row(
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
                                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10), // Thêm padding cho Text
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "484A Lê Văn Việt, Phường Tăng Nhơn Phú A, Quận 9",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 5), // Thêm khoảng cách giữa hai Text
                                      Text(
                                        "1 thg 1 2024, 16:20",
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
                                "40.000đ" + "   ",
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
          ],
        ),
      ),
    );
  }
}
