import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/movies/presentation/widgets/loader.dart';
import 'package:movie/movies/presentation/widgets/network_image.dart';
import 'package:movie/movies/presentation/widgets/shader_mask_widget.dart';

import '../../../core/utils/constants_numbers.dart';
import '../controller/movie_details_bloc/movie_details_bloc.dart';
import '../controller/movie_details_bloc/movie_details_states.dart';

class MovieDetailsImage extends StatelessWidget {
  const MovieDetailsImage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder:
            (context, state) => SliverAppBar(
              pinned: true,
              expandedHeight: 0.45.sh,
              flexibleSpace: FlexibleSpaceBar(
                background: FadeIn(
                  duration: const Duration(
                    microseconds: ConstantNumbers.durationOfShowImages,
                  ),
                  child: ShaderMaskWidget(widget: _checkFindingImage(state)),
                ),
              ),
            ),
      );
}

Widget _checkFindingImage(MovieDetailsState state) =>
    state.movieDetails?.backdropPath == null
        ? LoaderWidget()
        : NetworkImageWidget(imagePath: state.movieDetails!.backdropPath);
