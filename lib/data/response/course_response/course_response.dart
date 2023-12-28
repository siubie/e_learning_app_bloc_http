import 'dart:convert';

import 'datum.dart';
import 'meta.dart';

class CourseResponse {
  List<Datum>? data;
  Meta? meta;

  CourseResponse({this.data, this.meta});

  @override
  String toString() => 'CourseResponse(data: $data, meta: $meta)';

  factory CourseResponse.fromMap(Map<String, dynamic> data) {
    return CourseResponse(
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
          .toList(),
      meta: data['meta'] == null
          ? null
          : Meta.fromMap(data['meta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'data': data?.map((e) => e.toMap()).toList(),
        'meta': meta?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CourseResponse].
  factory CourseResponse.fromJson(String data) {
    return CourseResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CourseResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  CourseResponse copyWith({
    List<Datum>? data,
    Meta? meta,
  }) {
    return CourseResponse(
      data: data ?? this.data,
      meta: meta ?? this.meta,
    );
  }
}
