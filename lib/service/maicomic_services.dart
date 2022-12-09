import 'dart:ffi';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:maicomic/model/Studio.dart';
import 'package:maicomic/model/User.dart';
import 'package:network_info_plus/network_info_plus.dart';

import '../model/Comic.dart';

class ComicService {
  final String Emu = "http://10.0.2.2:3000";
  final String baseUrlApi = "http://192.168.0.123:3000";
  var networks = NetworkInfo().getWifiIP();

  // final String baseUrlApi = "http://192.168.31.149:3000";
  // final String baseUrlApi = "http://192.168.30.251:3000";
  // final String baseUrlApi = "http://192.168.31.239:3000";
  // final String baseUrlApi = "http://192.168.43.7:3000";

// Future<InternetAddress> get selfIP async {
//     String ip = await Wifi.ip;
//     return InternetAddress(ip);
// }

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

  // Future<List<UserModel>> fetchDataUser(int idUser) async {
  //   Response response = await Dio().get("$baseUrlApi/users/$idUser");
  //   List<UserModel> users =
  //       (response.data as List).map((v) => UserModel.fromJSON(v)).toList();
  //   return users;
  // }

  Future<UserModel> fetchDataUser(int idUser) async {
    Response response = await Dio().get("$baseUrlApi/users/$idUser");
    UserModel users = UserModel.fromJSON(response.data);
    return users;
  }

  // Future<List<FavoriteModel>> fetchDataFavoriteComic() async {
  //   Response response = await Dio().get("$baseUrlApi/comics");

  //   List<FavoriteModel> favorites =
  //       (response.data as List).map((v) => FavoriteModel.fromJSON(v)).toList();
  //   return favorites;
  // }

  // Future<dynamic> fetchDataStudio(int idStudio) async {
  //   Response response = await Dio().get("$baseUrlApi/studios/$idStudio");
  //   var studioz = print('berhasil' + response.data.toString());
  //   return response.data['name'];
  // }

  Future<StudioModel> fetchDataStudioModel(int idStudio) async {
    Response response = await Dio().get("$baseUrlApi/studios/$idStudio");
    StudioModel studio = StudioModel.fromJSON(response.data);
    return studio;
  }
}
