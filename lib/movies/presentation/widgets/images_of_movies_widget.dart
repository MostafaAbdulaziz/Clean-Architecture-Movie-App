import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/constants_numbers.dart';
import 'package:movie/core/utils/enums/enums_states_request.dart';
import 'package:movie/movies/domain/entities/movie.dart';
import 'package:movie/movies/presentation/widgets/network_image.dart';

import '../../../core/network/constants/api_constants.dart' show Apis;
import '../operations_widgets/common_operations/check_request_state.dart';
import '../operations_widgets/common_operations/push_to_screen.dart'
    show pushToScreen;
import '../screens/movie_detail_screen.dart';

class ImagesOfMoviesWidget extends StatelessWidget {
  final List<Movie> movies;
  final RequestState requestState;
  const ImagesOfMoviesWidget({
    super.key,
    required this.requestState,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) => CheckingRequestState.checkRequestState(
    _createMoviesImages(),
    requestState,
    context,
  );

  Widget _createMoviesImages() => FadeIn(
    duration: Duration(milliseconds: ConstantNumbers.durationOfShowImages),
    child: SizedBox(height: 0.20.sh, child: _createImagesGroup()),
  );

  Widget _createImagesGroup() => ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 7).w,
    itemCount: movies.length,
    itemBuilder: (context, index) => _createImage(context, movies[index]),
  );

  Widget _createImage(BuildContext context, Movie movie) => Container(
    padding: const EdgeInsets.only(right: 5).w,
    child: InkWell(
      onTap: () => _clickImage(context, movie.id.toString()),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)).r,
        child: NetworkImageWidget(imagePath: movie.backdropPath),
      ),
    ),
  );

  void _clickImage(BuildContext context, String movieId) {
    Apis.movieId = movieId;
    pushToScreen(context, MovieDetailScreen());
  }
}
