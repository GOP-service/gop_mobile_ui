import 'package:flutter/material.dart';
import 'package:gop_passenger/core/app_color.dart';


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
      // backgroundColor: Colors.white, // Đặt màu nền trắng cho Scaffold

      appBar: AppBar(
        title: const Text(
          'Order History Item',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: const Column(
        children: [
          Divider(
            color: AppColor.blackColor,
            thickness: BorderSide.strokeAlignCenter,
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Căn giữa các thành phần theo trục chính

                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              'https://scontent.fsgn5-12.fna.fbcdn.net/v/t39.30808-1/430890385_1574342683416473_47905620107369819_n.jpg?stp=dst-jpg_s320x320&_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEN8kw77AcFtLB000vfG9DZv865VEU_A-O_zrlURT8D4zbI_CqlySp1j7HCkxDkL2fVXxSRZCeok3XtkDh3VAiS&_nc_ohc=WftgChfxLFkAb5Ucbie&_nc_ht=scontent.fsgn5-12.fna&oh=00_AfDhx4ThLbCHgjIf8rKKfXzABdKPps_n4XuOvw4iIOxpYQ&oe=662D4DCB'),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Chau Sóc Thái',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "wave RSX | 67-N1 32654",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5), // Thêm padding cho Divider
                            child: Divider(
                              color: Colors.grey, // Màu của đường kẻ
                              thickness: 1, // Độ dày của đường kẻ
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
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5), // Thêm padding cho Divider
                            child: Divider(
                              color: Colors.grey, // Màu của đường kẻ
                              thickness: 1, // Độ dày của đường kẻ
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
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5), // Thêm padding cho Divider
                            child: Divider(
                              color: Colors.grey, // Màu của đường kẻ
                              thickness: 1, // Độ dày của đường kẻ
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
/**
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
**/
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
