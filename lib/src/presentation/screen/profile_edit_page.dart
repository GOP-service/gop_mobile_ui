import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileEdit'),
      ),
      // body: const Center(
      //   child: Text('Profile'),
      // ),
      body: Center(
        // padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                setState(() {
                  isEditing = true;
                });
                // Thực hiện hành động khi nhấn vào nút
              },
              child: Text('Chỉnh sửa thông tin'),
            ),
            SizedBox(height: 10),
            Container(
              width: 350, // Chiều rộng của TextFormField
              child: TextFormField(
                initialValue: 'thai@gmail.com', // Thay thế bằng dữ liệu thực của bạn
                // style: TextStyle(color: Colors.black), // Màu chữ mặc định
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Bo tròn góc
                  ),
                ),
                enabled: isEditing, // Chỉ cho phép chỉnh sửa khi isEditing là true
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 350, // Chiều rộng của TextFormField
              child: TextFormField(
                initialValue: 'Nam', // Thay thế bằng dữ liệu thực của bạn
                // style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Giới tính',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Bo tròn góc
                  ),
                ),
                enabled: isEditing, // Chỉ cho phép chỉnh sửa khi isEditing là true
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 350, // Chiều rộng của TextFormField
              child: TextFormField(
                initialValue: ' Số 1 Võ Văn Ngân, Phường Linh Chiểu, TP Thủ Đức', // Thay thế bằng dữ liệu thực của bạn
                // style: TextStyle(color: Colors.black),
                maxLines: null, // Tự động mở rộng để hiển thị toàn bộ nội dung
                decoration: InputDecoration(
                  labelText: 'Địa chỉ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Bo tròn góc
                  ),
                ),
                enabled: isEditing, // Chỉ cho phép chỉnh sửa khi isEditing là true
              ),
            ),

            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isEditing = false;
                });
                // Thực hiện hành động khi nhấn vào nút
              },
              child: Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }
}