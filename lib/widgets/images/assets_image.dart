import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageWidget extends StatelessWidget {
  final String imageUrl;

  const CustomImageWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isNotEmpty) {
      return Image.network(
        imageUrl,
        height: 25,
        width: 25,
        fit: BoxFit.cover,
      );
    } else {
      return SvgPicture.asset(
        'assets/profile.svg',
        height: 25,
        width: 25,
        fit: BoxFit.cover,
      );
    }
  }
}
