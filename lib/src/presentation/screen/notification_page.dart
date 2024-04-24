import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Notifications'),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold, // Kiểu chữ đậm
            fontSize: 25,
          ),
        ),
        // backgroundColor: Colors.orange[200], // Đặt màu nền xanh
        centerTitle: true, // Căn giữa tiêu đề trên AppBar

      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            NotificationCardItem(
              notificationName: 'Tài xế đang đến vui lòng không chạy lung tung để tài xế dễ tìm ',
              notificationTime: '24/4/2024',
            ),
            NotificationCardItem(
              notificationName: 'Chuyến xe đã bị hủy vì không tìm được tài xế',
              notificationTime: '24/4/2024',
            ),
            NotificationCardItem(
              notificationName: 'Không tìm được tài xế nên chuyến xe của bạn sẽ bị hủy trong giây lát',
              notificationTime: '24/4/2024',
            ),
          ],
        ),
      ), 
    );
  }
}
class NotificationCardItem extends StatefulWidget {
  const NotificationCardItem({
    Key? key,
    required this.notificationName,
    required this.notificationTime,
  }) : super(key: key);

  final String notificationName;
  final String notificationTime;

  @override
  _NotificationCardItemState createState() => _NotificationCardItemState();
}

class _NotificationCardItemState extends State<NotificationCardItem> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      child: SizedBox(
        width: 360,
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
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: isPressed ? Colors.orange : Colors.red,
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    widget.notificationName,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: isPressed ? Colors.black : Colors.black,
                                      fontWeight: isPressed ? FontWeight.normal : FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          widget.notificationTime,
                          style: TextStyle(
                            fontSize: 14,
                            color: isPressed ? Colors.black : Colors.black,
                            fontWeight: isPressed ? FontWeight.normal : FontWeight.bold,
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
