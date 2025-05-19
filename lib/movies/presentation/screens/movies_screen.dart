import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/services/service_locator.dart';
import 'package:movie/core/utils/constants_strings.dart';
import 'package:movie/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movie/movies/presentation/widgets/name_and_clickable_widget.dart';
import 'package:movie/movies/presentation/widgets/popular_session.dart';
import 'package:movie/movies/presentation/widgets/top_rated_widget.dart';

import '../controller/movies_bloc/movies_events.dart';
import '../widgets/now_playing_session.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (BuildContext context) =>
              serviceLocator<MovieBloc>()
                ..add(GetNowPlayingEvent())
                ..add(GetPopularEvent())
                ..add(GetTopRatedEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NowPayingSession(),
              NameAndClickableWidget(movieType: ConstantString.popularMovies),
              PopularSession(),
              NameAndClickableWidget(movieType: ConstantString.topRatedMovies),
              TopRatedSession(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
