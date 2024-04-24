import 'package:flutter/material.dart';

class OrderDetailItem extends StatefulWidget {
  const OrderDetailItem({Key? key}) : super(key: key);

  @override
  _OrderDetailItemState createState() => _OrderDetailItemState();
}

class _OrderDetailItemState extends State<OrderDetailItem> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Order History Item'),
        title: const Text(
          'Order History Item',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold, // Kiểu chữ đậm
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.greenAccent, // Đặt màu nền xanh
        centerTitle: true, // Căn giữa tiêu đề trên AppBar
      ),
      backgroundColor: Colors.greenAccent,
      body: Center(
        // padding: const EdgeInsets.all(20.0),
        child: Container(
          // width: MediaQuery.of(context).size.width * 0.95, // 90% chiều rộng của màn hình

          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.7,
          // padding: EdgeInsets.all(10), // Thêm padding cho Container
          child: const Row(
            children: <Widget>[
              Flexible(
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5,),
                              Icon(
                                Icons.location_on, // Icon bạn muốn sử dụng
                                color: Colors.red, // Màu của icon
                              ),
                              SizedBox(width: 5), // Khoảng cách giữa icon và text
                              Text(
                                "Điểm đến: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 5), // Thêm padding cho Text
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Trường đại học sư phạm kỹ thuật Thành Phố Hồ Chí Minh',
                                    style: TextStyle(
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5,),
                              Icon(
                                Icons.location_on, // Icon bạn muốn sử dụng
                                color: Colors.black, // Màu của icon
                              ),
                              SizedBox(width: 5), // Khoảng cách giữa icon và text
                              Text(
                                "Điểm đón: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 5), // Thêm padding cho Text
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '484 Lê Văn Việt, Phường Tăng Nhơn Phú A, Quận 9',
                                    style: TextStyle(
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5,),
                              Icon(
                                Icons.attach_money, // Icon bạn muốn sử dụng
                                color: Colors.red, // Màu của icon
                              ),
                              SizedBox(width: 5), // Khoảng cách giữa icon và text
                              Text(
                                "Chi phí: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 5), // Thêm padding cho Text
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '38.000' + ' VND',
                                    style: TextStyle(
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5,),
                              Icon(
                                Icons.access_time, // Icon bạn muốn sử dụng
                                color: Colors.black, // Màu của icon
                              ),
                              SizedBox(width: 5), // Khoảng cách giữa icon và text
                              Text(
                                "Giờ đặt xe: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 5), // Thêm padding cho Text
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '1 thg 1 2024, 16:20',
                                    style: TextStyle(
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5,),
                              Icon(
                                Icons.access_time, // Icon bạn muốn sử dụng
                                color: Colors.red, // Màu của icon
                              ),
                              SizedBox(width: 5), // Khoảng cách giữa icon và text
                              Text(
                                "Giờ hoàn thành: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 5), // Thêm padding cho Text
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '1 thg 1 2024, 16:20',
                                    style: TextStyle(
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5,),
                              Icon(
                                Icons.motorcycle, // Icon bạn muốn sử dụng
                                color: Colors.black, // Màu của icon
                              ),
                              SizedBox(width: 5), // Khoảng cách giữa icon và text
                              Text(
                                "Loại xe: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 5), // Thêm padding cho Text
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'wave RSX',
                                    style: TextStyle(
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5,),
                              Icon(
                                Icons.person, // Icon bạn muốn sử dụng
                                color: Colors.orange, // Màu của icon
                              ),
                              SizedBox(width: 5), // Khoảng cách giữa icon và text
                              Text(
                                "Tài xế: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 5), // Thêm padding cho Text
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Chau Sóc Thái',
                                    style: TextStyle(
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5,),
                              Icon(
                                Icons.motorcycle, // Icon bạn muốn sử dụng
                                color: Colors.blueGrey, // Màu của icon
                              ),
                              SizedBox(width: 5), // Khoảng cách giữa icon và text
                              Text(
                                "Biển số xe: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 5), // Thêm padding cho Text
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '67-N1 32654',
                                    style: TextStyle(
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
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
      ),
    );
  }
}