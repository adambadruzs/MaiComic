import 'package:dio/dio.dart';

void main() async {
  Dio dio = Dio();
  // Map<String, String> uploadData = {
  //   'username': 'Fahrendra',
  //   'password': 'Fahrendra123',
  //   'email': 'Fahrendra123@gmail.com',
  //   'gender': 'male',
  // };

  // var pos = await dio.post('http://localhost:3000/user', data: uploadData);

  var get = await dio.get('http://localhost:3000/user/1');
  // var getdata = get.data;

  // print(getdata['user']['username']);
  // http://localhost:3000/employees?first_name=Sebastian

  // put del disamping user kasi id
  // var put = await dio.put('http://localhost:3000/user/3', data: uploadData);

  // var del = await dio.delete('http://localhost:3000/user/2');

  print(get.data);
}
