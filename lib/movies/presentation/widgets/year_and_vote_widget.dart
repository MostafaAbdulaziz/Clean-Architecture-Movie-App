import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/movies/presentation/widgets/star_widget.dart';

class YearAndVoteAverageWidget extends StatelessWidget {
  final String date;
  final String voteAverage;
  const YearAndVoteAverageWidget({
    super.key,
    required this.date,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      _createMovieDate(context: context, data: _getYear(date)),
      SizedBox(width: 22.w),
      StarWidget(),
      _createVoteAverage(context, voteAverage),
    ],
  );
}

Widget _createMovieDate({
  required BuildContext context,
  required String data,
}) => Container(
  padding: EdgeInsets.all(1.3).w,
  decoration: BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.circular(3).r,
  ),
  child: Text(data, style: Theme.of(context).textTheme.labelSmall),
);

Widget _createVoteAverage(BuildContext context, String voteAverage) =>
    Text(voteAverage, style: Theme.of(context).textTheme.labelSmall);

String _getYear(String date) => date.substring(0, 4);
