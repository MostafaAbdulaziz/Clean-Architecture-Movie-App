import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/movies/presentation/widgets/network_image.dart';

import '../../../core/utils/constants_numbers.dart';
import '../controller/movie_details_bloc/movie_details_bloc.dart';
import '../controller/movie_details_bloc/movie_details_states.dart';

class MoreLikeMovieSession extends StatelessWidget {
  const MoreLikeMovieSession({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder:
            (context, state) => SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return FadeInUp(
                  from: 0.15.sh,
                  duration: const Duration(
                    milliseconds: ConstantNumbers.durationOfShowImages,
                  ),
                  child: _createOneImage(state, index),
                );
              }, childCount: state.movieRecommendations.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 6.h,
                crossAxisSpacing: 6.w,
                childAspectRatio: 2 / 3.dg,
                crossAxisCount: 3,
              ),
            ),
      );

  Widget _createOneImage(MovieDetailsState state, int index) => ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(1.2)).r,
    child: NetworkImageWidget(
      imagePath: state.movieRecommendations[index].backdropPath,
    ),
  );
}
