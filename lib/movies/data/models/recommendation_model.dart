import 'package:movie/movies/data/models/movie_model.dart';
import 'package:movie/movies/domain/entities/recommendations.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({required super.backdropPath, required super.id});
  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath: checkPicture(json['backdrop_path']),
        id: json['id'],
      );
}
