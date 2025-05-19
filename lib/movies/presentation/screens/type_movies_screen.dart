import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/services/service_locator.dart';
import 'package:movie/core/utils/colors.dart';
import 'package:movie/core/utils/constants_numbers.dart';
import 'package:movie/movies/domain/entities/movie.dart';
import 'package:movie/movies/presentation/controller/movies_bloc/movies_bloc.dart';

import '../widgets/movie_data_Widget.dart';
import '../widgets/network_image.dart';

class TypeMoviesScreen extends StatelessWidget {
  final List<Movie> movies;
  final String moviesType;
  const TypeMoviesScreen({
    super.key,
    required this.movies,
    required this.moviesType,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => serviceLocator<MovieBloc>(),
    child: Scaffold(
      appBar: AppBar(title: Text(moviesType)),
      body: ListView.builder(
        itemBuilder:
            (context, index) => _createMovieItem(movies[index], context),
        itemCount: movies.length,
      ),
    ),
  );

  Widget _createMovieItem(Movie movie, BuildContext context) => Container(
    padding: const EdgeInsets.all(6).w,
    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2).w,
    decoration: _createDecoration(),
    child: _createContentItem(movie: movie, context: context),
  );

  BoxDecoration _createDecoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(6).r,
    color: ConstantColors.grey,
  );
  Row _createContentItem({
    required Movie movie,
    required BuildContext context,
  }) => Row(
    children: [
      NetworkImageWidget(imagePath: movie.backdropPath),
      SizedBox(width: ConstantNumbers.screenWidth / 35),
      MovieDataWidget(movie: movie),
    ],
  );
}
