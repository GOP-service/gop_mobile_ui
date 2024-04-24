import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImageWidget extends StatefulWidget {
  String url;
  double widthSize;
  double heightSize;
  Color? color;
  SvgImageWidget(
      {super.key,
      required this.url,
      required this.heightSize,
      required this.widthSize,
      required this.color});

  @override
  State<SvgImageWidget> createState() => _SvgImageWidgetState();
}

class _SvgImageWidgetState extends State<SvgImageWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.color != null) {
      return ColorFiltered(
          colorFilter: ColorFilter.mode(widget.color!, BlendMode.srcIn),
          child: SvgPicture.asset(widget.url,
              width: widget.widthSize, height: widget.heightSize));
    } else {
      return SvgPicture.asset(widget.url,
          width: widget.widthSize, height: widget.heightSize);
    }
  }
}
