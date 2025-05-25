import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/constants_numbers.dart';
import '../../../core/utils/constants_strings.dart';

class MoreLikeThisTextWidget extends StatelessWidget {
  const MoreLikeThisTextWidget({super.key});

  @override
  Widget build(BuildContext context) => SliverPadding(
    padding: const EdgeInsets.fromLTRB(2.5, 2, 0, 4).w,
    sliver: SliverToBoxAdapter(
      child: FadeInUp(
        from: 0.15.sh,
        duration: const Duration(
          milliseconds: ConstantNumbers.durationOfShowImages,
        ),
        child: Text(
          ConstantString.moreLikeThis,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    ),
  );
}
