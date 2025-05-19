import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/constants_numbers.dart';
import 'package:movie/movies/presentation/widgets/shader_mask_widget.dart';

import '../../../core/network/constants/api_constants.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/constant_icons.dart';
import '../../../core/utils/constants_strings.dart';
import '../../domain/entities/movie.dart';
import '../controller/movies_bloc/movies_bloc.dart';
import '../controller/movies_bloc/movies_states.dart';
import '../operations_widgets/common_operations/check_request_state.dart';
import '../operations_widgets/common_operations/push_to_screen.dart';
import '../screens/movie_detail_screen.dart';
import 'network_image.dart';

class NowPayingSession extends StatelessWidget {
  const NowPayingSession({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<MovieBloc, MoviesState>(
    builder:
        (context, state) => CheckingRequestState.checkRequestState(
          _createNowPlatingUi(state: state, context: context),
          state.nowPlayingState,
          context,
        ),
  );
}

_createNowPlatingUi({
  required MoviesState state,
  required BuildContext context,
}) => FadeIn(
  duration: const Duration(milliseconds: ConstantNumbers.durationOfShowImages),
  child: CarouselSlider(
    options: _setCarouselOptions(),
    items: _createNowPlayingMoviesGroup(context, state),
  ),
);
CarouselOptions _setCarouselOptions() => CarouselOptions(
  height: 0.45.sh,
  viewportFraction: ConstantNumbers.viewportFractionOfCarousel,
);
void _clickImage(BuildContext context, Movie movie) {
  Apis.movieId = movie.id.toString();
  pushToScreen(context, MovieDetailScreen());
}

List<Widget> _createNowPlayingMoviesGroup(
  BuildContext context,
  MoviesState state,
) =>
    state.nowPlayingMovies.map((item) {
      return GestureDetector(
        onTap: () => _clickImage(context, item),
        child: Stack(
          children: [
            _createImageMovie(item),
            _createTextPosition(context, item),
          ],
        ),
      );
    }).toList();
Widget _createTextPosition(BuildContext context, Movie movie) => Align(
  alignment: Alignment.bottomCenter,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      _createNowPlayingWord(context),
      SizedBox(height: 10.h),
      _createMovieName(movie, context),
      SizedBox(height: 6.h),
    ],
  ),
);
Widget _createImageMovie(Movie movie) => ShaderMaskWidget(
  widget: NetworkImageWidget(
    imagePath: movie.backdropPath,
    height: 0.45.sh,
    width: double.infinity,
  ),
);
Widget _createNowPlayingWord(BuildContext context) => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(
      ConstantIcons.circleIcon,
      color: ConstantColors.redAccent,
      size: 15.dg,
    ),
    SizedBox(width: 2.w),
    Text(
      ConstantString.nowPlaying,
      style: Theme.of(context).textTheme.bodyMedium,
    ),
  ],
);
Widget _createMovieName(Movie movie, BuildContext context) => Text(
  movie.title,
  textAlign: TextAlign.center,
  style: Theme.of(context).textTheme.labelMedium,
);
