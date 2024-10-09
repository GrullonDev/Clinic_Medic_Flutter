import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageWidget extends StatelessWidget {
  final String imageUrl;
  final bool isNetwork;
  final double height;
  final double width;
  final BoxFit fit;

  const CustomImageWidget({
    super.key,
    required this.imageUrl,
    this.isNetwork = true,
    this.height = 450,
    this.width = 450,
    required this.fit,
  });

  @override
  Widget build(BuildContext context) {
    if (isNetwork) {
      // Si la imagen es remota (de la red)
      return SvgPicture.network(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
      );
    } else {
      // Si la imagen es local (de los assets)
      return SvgPicture.asset(
        'assets/$imageUrl.svg',
        height: height,
        width: width,
        fit: fit,
      );
    }
  }
}
