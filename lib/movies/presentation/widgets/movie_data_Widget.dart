import 'package:flutter/material.dart';
import 'package:movie/core/utils/constants_numbers.dart';
import 'package:movie/movies/domain/entities/movie.dart';
import 'package:movie/movies/presentation/widgets/year_and_vote_widget.dart';

class MovieDataWidget extends StatelessWidget {
  final Movie movie;
  const MovieDataWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _createMovieName(context: context, movieName: movie.title),
      SizedBox(height: ConstantNumbers.screenHeight / 70),
      YearAndVoteAverageWidget(
        date: movie.releaseDate,
        voteAverage: movie.voteAverage.toString(),
      ),
      SizedBox(height: ConstantNumbers.screenHeight / 70),
      _createOverview(context, movie.overview),
    ],
  );
}

Widget _createMovieName({
  required BuildContext context,
  required String movieName,
}) => SizedBox(
  width: ConstantNumbers.screenWidth / 1.7,
  child: Text(
    movieName,
    style: Theme.of(context).textTheme.labelMedium,
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
  ),
);

Widget _createOverview(BuildContext context, String overview) => SizedBox(
  width: ConstantNumbers.screenWidth / 1.7,
  child: Text(
    overview,
    style: Theme.of(context).textTheme.bodySmall,
    overflow: TextOverflow.ellipsis,
    maxLines: 3,
  ),
);
