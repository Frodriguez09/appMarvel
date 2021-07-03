// Clase para obtener al personaje
class CharacterModel {
  int id;
  String name;
  String description;
  Thumbnail thumbnail;

  CharacterModel({this.id, this.name, this.description, this.thumbnail});

  factory CharacterModel.fromJsonCharacter(Map<String, dynamic> character) =>
      CharacterModel(
        id: character['id'],
        name: character['name'],
        description: character['description'],
        thumbnail: character['thumbnail'] != null
            ? new Thumbnail.fromJson(character['thumbnail'])
            : null,
      );
}

// Clase para unir el path de la foto con la extension
class Thumbnail {
  String path;
  String extension;

  Thumbnail({this.path, this.extension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['extension'] = this.extension;
    return data;
  }
}
