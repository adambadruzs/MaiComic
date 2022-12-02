import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:maicomic/service/maicomic_services.dart';

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

  // var getcomics = await dio.get('http://192.168.0.123:3000/comics');
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

  // print(get.data);

//   Future<String> getStudioName(int idStudio) asynch{
//      var res = await dio.get('http://192.168.0.123:3000/studios/idStudio);
//      ..
//      ..

//    return resData["name"] as String;
// }
// print(getcomics.data);
  var id = 6;
  Map<String, dynamic> uploadData = {
    'cover': 'assets/images/Cover/dimon.jpg',
    "name": "Youngest Scionzz",
    "episode": 1,
    "studio": "Nightmare Factory Studio",
    "status": "Completed",
    "type": "Manhwa",
    "description": "Delicious Lava Ramene with Spicy taste"
  };
  var responseApi = await dio.patch('$baseUrlApi/comics/$id', data: uploadData);
  debugPrint(responseApi.data.toString());
}
