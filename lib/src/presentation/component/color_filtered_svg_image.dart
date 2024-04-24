import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ColorFilteredSvgImage extends StatefulWidget {
  final String url;
  final double width;
  final double height;
  final Color color;

  const ColorFilteredSvgImage({
    Key? key,
    required this.url,
    required this.width,
    required this.height,
    required this.color,
  }) : super(key: key);

  @override
  _ColorFilteredSvgImageState createState() => _ColorFilteredSvgImageState();
}

class _ColorFilteredSvgImageState extends State<ColorFilteredSvgImage> {
  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(widget.color, BlendMode.srcIn),
      child: SvgPicture.asset(
        widget.url,
        width: widget.width,
        height: widget.height,
      ),
    );
  }
}