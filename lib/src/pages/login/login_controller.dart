import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToRegisterPage(){
    Get.toNamed('/register');
  }

  void login(){
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    if(isValidForm(email,password)){
      Get.snackbar('Formulario valido', 'Estas listo para enviar la peticion http');
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