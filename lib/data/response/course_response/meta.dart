import 'dart:convert';

import 'pagination.dart';

class Meta {
  Pagination? pagination;

  Meta({this.pagination});

  @override
  String toString() => 'Meta(pagination: $pagination)';

  factory Meta.fromMap(Map<String, dynamic> data) => Meta(
        pagination: data['pagination'] == null
            ? null
            : Pagination.fromMap(data['pagination'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'pagination': pagination?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Meta].
  factory Meta.fromJson(String data) {
    return Meta.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Meta] to a JSON string.
  String toJson() => json.encode(toMap());

  Meta copyWith({
    Pagination? pagination,
  }) {
    return Meta(
      pagination: pagination ?? this.pagination,
    );
  }
}
