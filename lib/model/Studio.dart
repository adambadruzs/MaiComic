class StudioModel {
  final String name;
  final int id;

  StudioModel({required this.name, required this.id});

  factory StudioModel.fromJSON(Map parsedJson) {
    return StudioModel(id: parsedJson['id'], name: parsedJson['name']);
  }
}
