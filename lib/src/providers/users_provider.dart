import 'dart:convert';
import 'package:flutter_rentandomanos/src/environment/environment.dart';
import 'package:flutter_rentandomanos/src/models/response_api.dart';
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

  Future<ResponseApi> login(String email, String password) async {
    Response response = await post(
        '$url/login',
        {
          'email':email,
          'password':password
        },
        headers: {
          'Content-Type': 'application/json'
        }
    ); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if(response.body == null){
      Get.snackbar('Error','No se pudo ejecutar la peticion');
      return ResponseApi();
    }
    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }
}