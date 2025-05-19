import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/movies_bloc/movies_bloc.dart';
import '../controller/movies_bloc/movies_states.dart';
import 'images_of_movies_widget.dart';

class TopRatedSession extends StatelessWidget {
  const TopRatedSession({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<MovieBloc, MoviesState>(
    builder:
        (context, state) => ImagesOfMoviesWidget(
          movies: state.topRatedMovies,
          requestState: state.topRatedState,
        ),
  );
}
