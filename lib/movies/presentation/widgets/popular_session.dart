import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movies/presentation/controller/movies_bloc/movies_bloc.dart';

import '../controller/movies_bloc/movies_states.dart';
import 'images_of_movies_widget.dart';

class PopularSession extends StatelessWidget {
  const PopularSession({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MoviesState>(
      builder:
          (context, state) => ImagesOfMoviesWidget(
            movies: state.popularMovies,
            requestState: state.popularState,
          ),
    );
  }
}
