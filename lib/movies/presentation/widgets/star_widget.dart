import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/colors.dart';

class StarWidget extends StatelessWidget {
  const StarWidget({super.key});

  @override
  Widget build(BuildContext context) => RatingBarIndicator(
    rating: 1,
    itemBuilder:
        (context, index) => Icon(Icons.star, color: ConstantColors.amber),
    itemCount: 1,
    itemSize: 23.w,
    direction: Axis.horizontal,
  );
}
