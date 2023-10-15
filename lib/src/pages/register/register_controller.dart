import 'package:flutter/material.dart';
import 'package:flutter_rentandomanos/src/models/user.dart';
import 'package:flutter_rentandomanos/src/providers/users_provider.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void register() async{
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text;
    String password = passwordController.text.trim();
    String confirmpassword = confirmpasswordController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    if(isValidForm(email,name,lastname,phone,password,confirmpassword)){
      User user = User(
        email: email,
        name: name,
        lastname: lastname,
        phone: phone,
        password: password,
      );
      
      Response response = await usersProvider.create(user);

      print('RESPONSE: ${response.body}');

      Get.snackbar('Formulario valido', 'Estas listo para enviar la peticion http');
    }
  }

  bool isValidForm(String email,String name,String lastname,String phone, String password, String confirmPassword){
    if(!GetUtils.isEmail(email)){
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if(email.isEmpty){
      Get.snackbar('Formulario no valido', 'Ingresa tu email');
      return false;
    }

    if(name.isEmpty){
      Get.snackbar('Formulario no valido', 'Ingresa tu nombre');
      return false;
    }

    if(lastname.isEmpty){
      Get.snackbar('Formulario no valido', 'Ingresa tu apellido');
      return false;
    }

    if(phone.isEmpty){
      Get.snackbar('Formulario no valido', 'Ingresa tu numero telefonico');
      return false;
    }

    if(password.isEmpty){
      Get.snackbar('Formulario no valido', 'Ingresa una contraseña');
      return false;
    }

    if(confirmPassword.isEmpty){
      Get.snackbar('Formulario no valido', 'Ingresa la confirmacion de la contraseña');
      return false;
    }

    if(password!= confirmPassword){
      Get.snackbar('Formulario no valido', 'Las contraseñas no coinciden');
      return false;
    }
    return true;
  }
}