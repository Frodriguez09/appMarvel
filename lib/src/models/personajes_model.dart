// Clase para obtener al personaje
class CharacterModel {
  final int id;
  final String name;
  final String images;
  final String description;
  final int totalComics;
  final int totalSeries;

  CharacterModel(
      {this.id,
      this.name,
      this.images,
      this.description,
      this.totalComics,
      this.totalSeries});

  factory CharacterModel.fromJson(dynamic json) {
    return CharacterModel(
        id: json['id'] as int,
        name: json['name'] as String,
        images: json['thumbnail']['path'] as String,
        description: json['description'] as String,
        totalComics: json['comics']['available'] as int,
        totalSeries: json['series']['available'] as int);
  }

  static List<CharacterModel> characterFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return CharacterModel.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {id:$id ,name: $name, image: $images, description: $description, totalComics: $totalComics}, totalSeries: $totalSeries';
  }
}
