import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/movies/presentation/widgets/text_button_widget.dart';

class NameAndClickableWidget extends StatelessWidget {
  final String movieType;

  const NameAndClickableWidget({super.key, required this.movieType});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.fromLTRB(1.0, 5.0, 1, 1).w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _createMovieType(context),
        TextButtonWidget(movieType: movieType),
      ],
    ),
  );

  Widget _createMovieType(BuildContext context) => Text(
    movieType,
    style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 15.sp),
  );
}
