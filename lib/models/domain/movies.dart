import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/models/movie.dart';

part 'movies.freezed.dart';
part 'movies.g.dart';

@freezed
class Movies with _$Movies {
  @JsonSerializable(explicitToJson: true)
  const factory Movies({
    @Default(0) int id,
    @Default([]) List<Movie> movies,
    @Default('') String type,
    @Default(0) int page,
    @Default(0) int totalPages,
    @Default(0) int totalResults,
    @Default(false) bool cached,
  }) = _Movies;

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
}
