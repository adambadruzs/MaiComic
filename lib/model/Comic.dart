class ComicModel {
  final String cover, name, studio, status, type, description;
  final int episode;

  ComicModel({
    required this.cover,
    required this.name,
    required this.episode,
    required this.studio,
    required this.status,
    required this.type,
    required this.description,
  });

  factory ComicModel.fromJSON(Map parsedJson) {
    return ComicModel(
        cover: parsedJson['cover'],
        name: parsedJson['name'],
        episode: parsedJson['episode'],
        studio: parsedJson['studio'],
        status: parsedJson['status'],
        type: parsedJson['type'],
        description: parsedJson['description']);
  }
}
