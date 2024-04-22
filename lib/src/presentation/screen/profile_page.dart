import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      // body: const Center(
      //   child: Text('Profile'),
      // ),
      body: Center(
        // padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Căn giữa các thành phần theo trục chính

              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://scontent.fsgn5-12.fna.fbcdn.net/v/t39.30808-1/430890385_1574342683416473_47905620107369819_n.jpg?stp=dst-jpg_s320x320&_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEN8kw77AcFtLB000vfG9DZv865VEU_A-O_zrlURT8D4zbI_CqlySp1j7HCkxDkL2fVXxSRZCeok3XtkDh3VAiS&_nc_ohc=gEr_wOA_4xwAb7_t9E-&_nc_ht=scontent.fsgn5-12.fna&oh=00_AfBlqNinv65-rm-aru0gxFiRo78wBZztLHyLe1OaK4_gxA&oe=6626B64B'),
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
                    ElevatedButton(
                      onPressed: () {
                        context.go('/profile/edit');
                        // Thực hiện hành động khi nhấn vào nút
                      },
                      child: Text('Chỉnh sửa thông tin'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 10), // Padding sang phải
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '76 Point * Rewards Member',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800], // Sử dụng màu xám nhạt trong hệ thống màu của Material Design
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20), // Điều chỉnh khoảng cách sang trái
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[600], // Sử dụng màu xám nhạt cho icon
                        ),                      ),                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rewards',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800],                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20), // Điều chỉnh khoảng cách sang trái
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[600], // Sử dụng màu xám nhạt cho icon
                        ),                       ),                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Scheduled',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800],                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20), // Điều chỉnh khoảng cách sang trái
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[600], // Sử dụng màu xám nhạt cho icon
                        ),                       ),                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cards',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800],                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20), // Điều chỉnh khoảng cách sang trái
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[600], // Sử dụng màu xám nhạt cho icon
                        ),                       ),                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subcriptions',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800],                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20), // Điều chỉnh khoảng cách sang trái
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[600], // Sử dụng màu xám nhạt cho icon
                        ),                       ),                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Saved Places',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800],                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20), // Điều chỉnh khoảng cách sang trái
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[600], // Sử dụng màu xám nhạt cho icon
                        ),                       ),                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Help Centre',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800],                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20), // Điều chỉnh khoảng cách sang trái
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[600], // Sử dụng màu xám nhạt cho icon
                        ),                       ),                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Emergency Contacts',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800],                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20), // Điều chỉnh khoảng cách sang trái
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[600], // Sử dụng màu xám nhạt cho icon
                        ),                       ),                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Drive with GOP',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800],                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20), // Điều chỉnh khoảng cách sang trái
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[600], // Sử dụng màu xám nhạt cho icon
                        ),                       ),                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),

                  // Các phần tử khác ở đây...
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}