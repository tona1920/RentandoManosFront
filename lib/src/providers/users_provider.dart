import 'dart:convert';
import 'package:flutter_rentandomanos/src/environment/environment.dart';
import 'package:flutter_rentandomanos/src/models/user.dart';
import 'package:get/get.dart';

class UsersProvider extends GetConnect {

  String url = Environment.API_URL + 'api/users';


  Future<Response> create(User user) async {
    Response response = await post(
        '$url/create',
        user.toJson(),
        headers: {
          'Content-Type': 'application/json'
        }
    ); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    return response;
  }
}