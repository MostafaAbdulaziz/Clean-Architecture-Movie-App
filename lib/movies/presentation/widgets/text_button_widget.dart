import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/constant_icons.dart';
import '../../../core/utils/constants_strings.dart';
import '../../domain/entities/movie.dart';
import '../controller/movies_bloc/movies_bloc.dart';
import '../controller/movies_bloc/movies_states.dart';
import '../operations_widgets/common_operations/push_to_screen.dart';
import '../screens/type_movies_screen.dart';

class TextButtonWidget extends StatelessWidget {
  final String movieType;
  const TextButtonWidget({super.key, required this.movieType});

  @override
  Widget build(BuildContext context) =>BlocBuilder<MovieBloc, MoviesState>(
    builder:
        (context, state) => TextButton.icon(
      onPressed: () => _click(context: context, movies: getMovies(state)),
      icon: Icon(ConstantIcons.arrowBackIcon),
      label: Text(
        ConstantString.seeMore,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      iconAlignment: IconAlignment.end,
    ),
  );


  List<Movie> getMovies(MoviesState state) => checkMoviesType(state);

  void _click({required BuildContext context, required List<Movie> movies}) =>
      pushToScreen(
        context,
        TypeMoviesScreen(movies: movies, moviesType: movieType),
      );

  List<Movie> checkMoviesType(MoviesState state) =>
      movieType == ConstantString.popularMovies
          ? state.popularMovies
          : state.topRatedMovies;
}