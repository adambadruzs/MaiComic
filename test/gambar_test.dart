import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:maicomic/service/maicomic_services.dart';

void main() async {
  // var covers = "{name: 1669998070909.jpg}";
  // // var covers = tes.replaceAll('{name: ', '');
  // // covers = covers.replaceAll('}', '');

  // covers = covers.replaceAll(RegExp('[{name: }]'), '');
  // // var covers = Storage;
  // debugPrint(covers);
  // print('\n' + '1669998070909.jpg');

  var baseUrl = ComicService().baseUrlApi;
  var controllerUsername = "adam11@gmail.com";
  var usernames = await Dio().get('$baseUrl/users?email=${controllerUsername}');
  // debugPrint(usernames.data.toString());

  var detect = usernames.data;
  var baru = detect[0];
  debugPrint(detect.toString());
  debugPrint(baru.toString());
}
