import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_crud/data/storage.dart';
import 'package:getx_crud/model/StudentModel.dart';

class StudentController extends GetxController{

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  List<StudentModel> studentModel = [];

  bool isLoading = false;


  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  void initialize(){

    isLoading = false;
    for (var element in Storage.users) {
      studentModel.add(StudentModel.formJson(element));
    }
    isLoading = true;
    update();
  }

  void addStudent(){

  }

  void editStudent(){

  }

  void deleteStudent(){

  }

}