import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/constant_icons.dart';
import 'package:movie/movies/presentation/widgets/shimmer.dart';

import '../../../core/network/constants/api_constants.dart';

class NetworkImageWidget extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  const NetworkImageWidget({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(5)).r,
    child: CachedNetworkImage(
      width: width ?? 0.3.sw,
      height: height ?? 0.18.sh,
      fit: BoxFit.cover,
      imageUrl: Apis.getImageUrl(imagePath),
      placeholder: (context, url) => ShimmerWidget(),
      errorWidget: (context, url, error) => const Icon(ConstantIcons.errorIcon),
    ),
  );
}
