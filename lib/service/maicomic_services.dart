import 'package:dio/dio.dart';

class ComicService {
  static Future<List<dynamic>> getDataComic() async {
    Dio dio = Dio();
    var response = await dio.get('http://localhost:3000/data');
    print('status code : ${response.statusCode}');
    var dataResponse = response.data;

    return dataResponse;
  }
}
