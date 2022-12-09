import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:maicomic/model/User.dart';
import 'package:maicomic/service/maicomic_services.dart';
import 'package:network_info_plus/network_info_plus.dart';

void main() async {
  Dio dio = Dio();

  var Emu = ComicService().Emu; //Emu //No Respond HP

  //db.json
  var baseUrlApi = ComicService().baseUrlApi; //Kos

  // Map<String, String> uploadData = {
  //   'username': 'Fahrendra',
  //   'password': 'Fahrendra123',
  //   'email': 'Fahrendra123@gmail.com',
  //   'gender': 'male',
  // };

  // Map<String, String> uploadData = {'cName': 'One Punch Man'};

  // var pos = await dio.post('http://localhost:3000/user/1/favourite',
  //     data: uploadData);

  // var gets = getcomics;

  // var tes = gets.comics;

  // var getstudio = await dio.get('http://192.168.43.7:3000/studios');

  // var get = await dio
  //     .get('https://my-json-server.typicode.com/adambadruzz/MaiComic/data');

  // print(getdata['user']['username']);
  // http://localhost:3000/employees?first_name=Sebastian

  // put del disamping user kasi id
  // var put = await dio.put('http://localhost:3000/user/3', data: uploadData);

  // var del = await dio.delete('http://localhost:3000/user/2');

//mulai dari 0
//angka id S+ 1

//   Future<String> getStudioName(int idStudio) asynch{
//      var res = await dio.get('http://192.168.0.123:3000/studios/idStudio);
//      ..
//      ..

//    return resData["name"] as String;
// }
// print(getcomics.data);
  // var id = 6;
  // Map<String, dynamic> uploadData = {
  //   'cover': 'assets/images/Cover/dimon.jpg',
  //   "name": "Youngest Scionzz",
  //   "episode": 1,
  //   "studio": "Nightmare Factory Studio",
  //   "status": "Completed",
  //   "type": "Manhwa",
  //   "description": "Delicious Lava Ramene with Spicy taste"
  // };
  // var responseApi = await dio.patch('$baseUrlApi/comics/$id', data: uploadData);
  // debugPrint(responseApi.data.toString());

  // int id = 6;
  // var getcomics = await dio.get('http://192.168.0.123:3000/comics?id=$id');

  // int idc = getcomics.data[0]['studioId'];
  // print('\n' + idc.toString());

  // print('\n' + getcomics.data.toString());

  // var getstudio = await dio.get('http://192.168.0.123:3000/studios?id=$idc');
  // var namastudio = getstudio.data[0]['name'];

  // print('\n' + getstudio.data.toString());

  // if (getcomics.data[0]["studioId"] == getstudio.data[0]['id']) {
  //   print("\n" + "berhasil");
  //   print("\n" + getstudio.data[0].toString());
  // } else {
  //   print("\n" + "gak ada");
  // }

  // int userid = 1;
  // int comicid = 4;
  // var del = await dio.delete('http://192.168.0.123:3000/favorites/3');
  // print(del.data);

  // var del = await dio.get('http://192.168.0.123:3000/users/2');
  // print(del.data);

  // int idUser = 1;
  // Response response = await Dio().get("$baseUrlApi/studios/$idStudio");

  // print("\n" + response.data["name"]);

  // var users = await ComicService().fetchDataStudio(idUser);

  // var dataku = users.toString();

  // print("\n" + dataku);
  // int idStudio = 1;

  // var studioId = idStudio;

  // var getstudio = await ComicService().fetchDataStudio(studioId);

  // print("\n" + "tidak berhasill" + getstudio.toString());

  // Future<String> studioname() async {
  //   var studioId = idStudio;
  //   var getstudio = await ComicService().fetchDataStudio(studioId);

  //   return getstudio;
  // }

  // studioname();
  // int s = 2;
  // int c = 1;

  // var favs = await Dio()
  //     .get('${ComicService().baseUrlApi}/favorites?userId=$s&comicId=$c');

  // var responseApi = await dio.delete(
  //   '${ComicService().baseUrlApi}/favorites/${favs.data[0]['id']}',
  // );
  // print('\n');
  // print(favs.data);
  // print('\n');
  // print(responseApi.data);
  // int users = 2;

  // var panjangs = await Dio().get("$baseUrlApi/favorites?userId=$users");

  // var comics = await Dio().get("$baseUrlApi/comics/");

  // // print(comics.data[0]['id']);

  // for (int i = 0; i < panjangs.data!.length; i++) {
  //   // var userid = panjangs.data[i]['userId'];
  //   var getcomicid = panjangs.data[i]['comicId'];

  //   for (int j = 0; j < comics.data!.length; j++) {
  //     var getuser = comics.data[j]['id'];

  //     print('\n ini getuser ' + getuser.toString());
  //     print('ini getcomicid ' + getcomicid.toString());
  //     print('ini getid ' + getuser.toString());

  //     if (getcomicid == getuser) {
  //       print("cocok");
  //       print(comics.data[j].toString());
  //     } else {
  //       print("gak ada");
  //     }
  //   }
  // }

  final NetworkInfo _networkInfo = NetworkInfo();

  var wifiIPv4Addr = await _networkInfo.getWifiIP();
  print(wifiIPv4Addr);
}
