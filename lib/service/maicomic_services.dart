import 'package:dio/dio.dart';
import 'package:maicomic/model/User.dart';

import '../model/Comic.dart';

class ComicService {
  final String Emu = "http://10.0.2.2:3000";
  final String baseUrlApi = "http://192.168.0.123:3000";
  // final String baseUrlApi = "http://192.168.30.251:3000";
  // final String baseUrlApi = "http://192.168.31.239:3000";
  // final String baseUrlApi = "http://192.168.43.7:3000";

  Future<List<dynamic>> getDataComic() async {
    Dio dio = Dio();
    var response = await dio.get('$baseUrlApi/comics');
    // var response = await dio.get('$baseUrlApi/user');
    // var response = await dio
    //     .get('https://my-json-server.typicode.com/adambadruzz/MaiComic/comics');
    print('status code : ${response.statusCode}');
    var dataResponse = response.data;

    return dataResponse;
  }

  Future<List<dynamic>> getDataComicManga() async {
    Dio dio = Dio();
    var response = await dio.get('$baseUrlApi/comics?type=Manga');
    // var response = await dio.get('$baseUrlApi/user');
    // var response = await dio
    //     .get('https://my-json-server.typicode.com/adambadruzz/MaiComic/comics');
    print('status code : ${response.statusCode}');
    var dataResponse = response.data;

    return dataResponse;
  }

  Future<List<dynamic>> getDataComicManhua() async {
    Dio dio = Dio();
    var response = await dio.get('$baseUrlApi/comics?type=Manhua');
    // var response = await dio.get('$baseUrlApi/user');
    // var response = await dio
    //     .get('https://my-json-server.typicode.com/adambadruzz/MaiComic/comics');
    print('status code : ${response.statusCode}');
    var dataResponse = response.data;

    return dataResponse;
  }

  Future<List<dynamic>> getDataComicManhwa() async {
    Dio dio = Dio();
    var response = await dio.get('$baseUrlApi/comics?type=Manhwa');
    // var response = await dio.get('$baseUrlApi/user');
    // var response = await dio
    //     .get('https://my-json-server.typicode.com/adambadruzz/MaiComic/comics');
    print('status code : ${response.statusCode}');
    var dataResponse = response.data;

    return dataResponse;
  }

  Future<List<dynamic>> getDataFav() async {
    Dio dio = Dio();
    var response = await dio.get('$baseUrlApi/comics?type=Manhwa');
    // var response = await dio.get('$baseUrlApi/user');
    // var response = await dio
    //     .get('https://my-json-server.typicode.com/adambadruzz/MaiComic/comics');
    print('status code : ${response.statusCode}');
    var dataResponse = response.data;

    return dataResponse;
  }

  Future<List<ComicModel>> fetchDataComic() async {
    Response response = await Dio().get("$baseUrlApi/comics");
    List<ComicModel> comics =
        (response.data as List).map((v) => ComicModel.fromJSON(v)).toList();
    return comics;
  }

  Future<List<ComicModel>> fetchDataComicManga() async {
    Response response = await Dio().get("$baseUrlApi/comics?type=Manga");
    List<ComicModel> comics =
        (response.data as List).map((v) => ComicModel.fromJSON(v)).toList();
    return comics;
  }

  Future<List<ComicModel>> fetchDataComicManhua() async {
    Response response = await Dio().get("$baseUrlApi/comics?type=Manhua");
    List<ComicModel> comics =
        (response.data as List).map((v) => ComicModel.fromJSON(v)).toList();
    return comics;
  }

  Future<List<ComicModel>> fetchDataComicManhwa() async {
    Response response = await Dio().get("$baseUrlApi/comics?type=Manhwa");
    List<ComicModel> comics =
        (response.data as List).map((v) => ComicModel.fromJSON(v)).toList();
    return comics;
  }
}
