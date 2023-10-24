import 'package:flutter/material.dart';
import 'package:flutter_rentandomanos/src/models/response_api.dart';
import 'package:flutter_rentandomanos/src/providers/users_provider.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void goToRegisterPage(){
    Get.toNamed('/register');
  }

  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    if(isValidForm(email,password)){
      ResponseApi responseApi = await usersProvider.login(email, password);

      print('Response Api: ${responseApi.toJson()}');
      if(responseApi.success == true){
        Get.snackbar('Login exitoso', responseApi.message ?? ''); //Null safety
      }else{
        Get.snackbar('Login fallido', responseApi.message ?? '');
      }

    }
  }

  bool isValidForm(String email, String password){
    if(!GetUtils.isEmail(email)){
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if(email.isEmpty){
      Get.snackbar('Formulario no valido', 'Ingresa un email');
      return false;
    }

    if(password.isEmpty){
      Get.snackbar('Formulario no valido', 'Ingresa una contraseña');
      return false;
    }
    return true;
  }
}