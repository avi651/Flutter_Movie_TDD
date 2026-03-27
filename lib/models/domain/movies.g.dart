// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoviesImpl _$$MoviesImplFromJson(Map<String, dynamic> json) => _$MoviesImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      movies: (json['movies'] as List<dynamic>?)
              ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      type: json['type'] as String? ?? '',
      page: (json['page'] as num?)?.toInt() ?? 0,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
      totalResults: (json['totalResults'] as num?)?.toInt() ?? 0,
      cached: json['cached'] as bool? ?? false,
    );

Map<String, dynamic> _$$MoviesImplToJson(_$MoviesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'movies': instance.movies.map((e) => e.toJson()).toList(),
      'type': instance.type,
      'page': instance.page,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
      'cached': instance.cached,
    };
