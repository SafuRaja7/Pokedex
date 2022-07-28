import 'dart:convert';


class PokemonModel {
  final String name;
  final String url;
  PokemonModel({
    required this.name,
    required this.url,
  });

  PokemonModel copyWith({
    String? name,
    String? url,
  }) {
    return PokemonModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) => PokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PokemonModel(name: $name, url: $url)';

  @override
  bool operator ==(covariant PokemonModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;


}
