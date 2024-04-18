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
                  'https://scontent.fsgn5-12.fna.fbcdn.net/v/t39.30808-1/430890385_1574342683416473_47905620107369819_n.jpg?stp=dst-jpg_s320x320&_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEN8kw77AcFtLB000vfG9DZv865VEU_A-O_zrlURT8D4zbI_CqlySp1j7HCkxDkL2fVXxSRZCeok3XtkDh3VAiS&_nc_ohc=gEr_wOA_4xwAb7_t9E-&_nc_ht=scontent.fsgn5-12.fna&oh=00_AfBlqNinv65-rm-aru0gxFiRo78wBZztLHyLe1OaK4_gxA&oe=6626B64B'),
            ),
            SizedBox(height: 20),
            Text(
              'Chau Sóc Thái',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 350, // Chiều rộng của TextFormField
              child: TextFormField(
                initialValue: 'thai@gmail.com', // Thay thế bằng dữ liệu thực của bạn
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Bo tròn góc
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 350, // Chiều rộng của TextFormField
              child: TextFormField(
                initialValue: 'Nam', // Thay thế bằng dữ liệu thực của bạn
                decoration: InputDecoration(
                  labelText: 'Giới tính',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Bo tròn góc
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 350, // Chiều rộng của TextFormField
              child: TextFormField(
                initialValue: ' Số 1 Võ Văn Ngân, Phường Linh Chiểu, TP Thủ Đức', // Thay thế bằng dữ liệu thực của bạn
                maxLines: null, // Tự động mở rộng để hiển thị toàn bộ nội dung
                decoration: InputDecoration(
                  labelText: 'Địa chỉ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Bo tròn góc
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
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