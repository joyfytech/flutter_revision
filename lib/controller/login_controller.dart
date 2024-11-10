import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class LoginController extends GetxController
{


  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> saveForm(BuildContext context) async{

    if(validateFields(context))
      {

        final mobileNo = mobileNumberController.text.toString();
        final password = passwordController.text.toString();

        print("Mobile Number : ${mobileNo}");
        print("Password : ${password}");


      }

  }

  bool validateFields(BuildContext context) {

    if(mobileNumberController.text.isEmpty)
      {
        Future.delayed(Duration.zero, () {
          Get.snackbar("Validation failed", "Mobile Number is required");
        });
        print("Enter Mobile Number1");

        return false;
      }

    if(passwordController.text.isEmpty)
      {

        Future.delayed(Duration.zero, () {
          Get.snackbar("Validation failed", "Password is required");
        });
        print("Enter Passwoord");
        return false;
      }

    return true;

  }




}