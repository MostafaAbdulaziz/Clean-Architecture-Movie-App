import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';
import 'package:movie/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie/movies/presentation/controller/movie_details_bloc/movie_details_states.dart';
import 'package:movie/movies/presentation/widgets/loader.dart';
import 'package:movie/movies/presentation/widgets/year_and_vote_widget.dart';

import '../../../core/utils/constants_numbers.dart';

class MovieDetailsSession extends StatelessWidget {
  const MovieDetailsSession({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) => _checkMovieDetails(state, context),
      );
}

Widget _checkMovieDetails(MovieDetailsState state, BuildContext context) =>
    state.movieDetails == null
        ? SliverToBoxAdapter(child: LoaderWidget())
        : _getMovieDetails(state.movieDetails, context);

Widget _getMovieDetails(MovieDetails? movieDetails, BuildContext context) =>
    SliverToBoxAdapter(
      child: FadeInUp(
        from: 0.1.sh,
        duration: const Duration(
          milliseconds: ConstantNumbers.durationOfShowImages,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.5).w,
          child: _createContent(context, movieDetails!),
        ),
      ),
    );

Widget _createContent(
  BuildContext context,
  MovieDetails movieDetails,
) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(movieDetails.title, style: Theme.of(context).textTheme.labelMedium),
    SizedBox(height: ConstantNumbers.screenHeight / 70),
    YearAndVoteAverageWidget(
      date: movieDetails.releaseDate,
      voteAverage: movieDetails.voteAverage.toString(),
    ),
    SizedBox(height: ConstantNumbers.screenHeight / 70),
    Text(movieDetails.overview, style: Theme.of(context).textTheme.bodySmall),
  ],
);
