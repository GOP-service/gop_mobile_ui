import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NetworkImageWidget extends StatefulWidget {
  String url;
  double widthSize;
  double heightSize;
  Color? color;
  NetworkImageWidget(
      {super.key,
      required this.url,
      required this.heightSize,
      required this.widthSize,
      required this.color});

  @override
  State<NetworkImageWidget> createState() => _NetworkImageWidgetState();
}

class _NetworkImageWidgetState extends State<NetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.color != null) {
      return ColorFiltered(
          colorFilter: ColorFilter.mode(widget.color!, BlendMode.srcIn),
          child: Container(
              width: widget.widthSize,
              height: widget.heightSize,
              child: Image.network(
                widget.url,
                width: widget.widthSize,
                height: widget.heightSize,
                fit: BoxFit.cover,
              )));
    } else {
      return Container(
          width: widget.widthSize,
          height: widget.heightSize,
          child: Image.network(widget.url,
              width: widget.widthSize,
              height: widget.heightSize,
              fit: BoxFit.cover));
    }
  }
}
