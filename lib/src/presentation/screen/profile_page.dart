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
            CircleAvatar(
              radius: 50,
              // backgroundImage: AssetImage('assets/profile_image.jpg'), // Đặt đường dẫn ảnh của bạn ở đây
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4FRdJhLdEEhFbcIuR-DEGYsFMjn-6QUGZ7A&s'),
            ),
            SizedBox(height: 20),
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
                // setState(() {
                //   isEditing = true;
                // });
                // Thực hiện hành động khi nhấn vào nút
              },
              child: Text('Chỉnh sửa thông tin'),
            ),
            SizedBox(height: 10),
            Text(
              'Email của bạn',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 350,
              height: 1, // Chiều cao của đường thẳng
              color: Colors.grey, // Màu của đường thẳng
              // width: double.infinity, // Độ rộng của đường thẳng bằng với chiều rộng của parent
            ),
            SizedBox(height: 10),
            Text(
              'Email của bạn',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 350,
              height: 1, // Chiều cao của đường thẳng
              color: Colors.grey, // Màu của đường thẳng
              // width: double.infinity, // Độ rộng của đường thẳng bằng với chiều rộng của parent
            ),
            SizedBox(height: 10),
            Text(
              'Email của bạn',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 350,
              height: 1, // Chiều cao của đường thẳng
              color: Colors.grey, // Màu của đường thẳng
              // width: double.infinity, // Độ rộng của đường thẳng bằng với chiều rộng của parent
            ),
            SizedBox(height: 10),
            Text(
              'Email của bạn',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 350,
              height: 1, // Chiều cao của đường thẳng
              color: Colors.grey, // Màu của đường thẳng
              // width: double.infinity, // Độ rộng của đường thẳng bằng với chiều rộng của parent
            ),
            SizedBox(height: 10),
            Text(
              'Email của bạn',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 350,
              height: 1, // Chiều cao của đường thẳng
              color: Colors.grey, // Màu của đường thẳng
              // width: double.infinity, // Độ rộng của đường thẳng bằng với chiều rộng của parent
            ),
            SizedBox(height: 10),
            Text(
              'Email của bạn',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 350,
              height: 1, // Chiều cao của đường thẳng
              color: Colors.grey, // Màu của đường thẳng
              // width: double.infinity, // Độ rộng của đường thẳng bằng với chiều rộng của parent
            ),
            SizedBox(height: 10),
            Text(
              'Email của bạn',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 350,
              height: 1, // Chiều cao của đường thẳng
              color: Colors.grey, // Màu của đường thẳng
              // width: double.infinity, // Độ rộng của đường thẳng bằng với chiều rộng của parent
            ),


          ],
        ),
      ),
    );
  }
}