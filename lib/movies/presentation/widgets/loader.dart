import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 0.42.sh,
    child: const Center(child: CircularProgressIndicator()),
  );
}
