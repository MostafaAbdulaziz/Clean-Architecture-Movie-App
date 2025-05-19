import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/services/service_locator.dart';
import 'package:movie/movies/presentation/controller/movie_details_bloc/movie_details_events.dart';

import '../../../core/utils/constants_numbers.dart';
import '../../../core/utils/constants_strings.dart';
import '../controller/movie_details_bloc/movie_details_bloc.dart';
import '../widgets/more_like_movie_widget.dart';
import '../widgets/movie_details_image.dart' show MovieDetailsImage;
import '../widgets/movie_details_widget.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (BuildContext context) =>
              serviceLocator<MovieDetailsBloc>()
                ..add(GetMovieDetailsEvent())
                ..add(GetRecommendationsEvent()),
      child: Scaffold(body: createMovieDetailsContent(context)),
    );
  }
}

Widget createMovieDetailsContent(BuildContext context) => CustomScrollView(
  key: const Key('movieDetailScrollView'),
  slivers: [
    MovieDetailsImage(),
    MovieDetailsSession(),
    createMoreLikeThisText(context),
    SliverPadding(
      padding: const EdgeInsets.fromLTRB(2.5, 0, 2.5, 0).w,
      sliver: MoreLikeMovieSession(),
    ),
  ],
);
Widget createMoreLikeThisText(BuildContext context) => SliverPadding(
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
