import 'dart:convert';

class Attributes {
  String? name;
  String? description;
  String? releaseDate;
  bool? onSale;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  Attributes({
    this.name,
    this.description,
    this.releaseDate,
    this.onSale,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  @override
  String toString() {
    return 'Attributes(name: $name, description: $description, releaseDate: $releaseDate, onSale: $onSale, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt)';
  }

  factory Attributes.fromMap(Map<String, dynamic> data) => Attributes(
        name: data['name'] as String?,
        description: data['description'] as String?,
        releaseDate: data['release_date'] as String?,
        onSale: data['onSale'] as bool?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
        publishedAt: data['publishedAt'] == null
            ? null
            : DateTime.parse(data['publishedAt'] as String),
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'description': description,
        'release_date': releaseDate,
        'onSale': onSale,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'publishedAt': publishedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Attributes].
  factory Attributes.fromJson(String data) {
    return Attributes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Attributes] to a JSON string.
  String toJson() => json.encode(toMap());

  Attributes copyWith({
    String? name,
    String? description,
    String? releaseDate,
    bool? onSale,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
  }) {
    return Attributes(
      name: name ?? this.name,
      description: description ?? this.description,
      releaseDate: releaseDate ?? this.releaseDate,
      onSale: onSale ?? this.onSale,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }
}
