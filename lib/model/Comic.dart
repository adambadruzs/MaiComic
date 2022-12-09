class ComicModel {
  final String cover, name, status, type, description;
  final int studioId, id, episode;
  final bool isFavorite;

  ComicModel({
    required this.cover,
    required this.name,
    required this.id,
    required this.episode,
    required this.studioId,
    required this.status,
    required this.type,
    required this.description,
    required this.isFavorite,
  });

  factory ComicModel.fromJSON(Map parsedJson) {
    return ComicModel(
        cover: parsedJson['cover'],
        name: parsedJson['name'],
        id: parsedJson['id'],
        episode: parsedJson['episode'],
        studioId: parsedJson['studioId'],
        status: parsedJson['status'],
        type: parsedJson['type'],
        description: parsedJson['description'],
        isFavorite: parsedJson['isFavorite']);
  }
}
