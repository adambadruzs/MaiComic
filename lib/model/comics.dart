class comicc {
  final String cCover, cName, cStudio, cDescription;
  final int cEpisode;

  comicc({
    required this.cCover,
    required this.cName,
    required this.cEpisode,
    required this.cStudio,
    required this.cDescription,
  });

  factory comicc.fromJSON(Map parsedJson) {
    return comicc(
        cCover: parsedJson['cCover'],
        cName: parsedJson['cName'],
        cEpisode: parsedJson['cEpisode'],
        cStudio: parsedJson['cStudio'],
        cDescription: parsedJson['cDescription']);
  }
}
