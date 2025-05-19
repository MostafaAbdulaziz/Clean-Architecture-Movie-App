import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: Colors.grey[850]!,
    highlightColor: Colors.grey[800]!,
    child: Container(
      height: 0.18.sh,
      width: 0.25.sw,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );
}
