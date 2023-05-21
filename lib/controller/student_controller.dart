import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_crud/data/storage.dart';
import 'package:getx_crud/model/StudentModel.dart';

class StudentController extends GetxController{

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  RxList<StudentModel> studentModel = <StudentModel>[].obs;

  bool isLoading = false;


  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  void initialize(){

    isLoading = false;
    for (var element in Storage.users) {
      studentModel.value.add(StudentModel.formJson(element));
    }
    isLoading = true;
    update();
  }

  void addStudent(){

    String id = idController.text;
    String name = nameController.text ;
    String phoneNumber = phoneNumberController.text;

    studentModel.value.add(StudentModel.formJson({
      "id":id,
      "name":name,
      "phone_number":phoneNumber
    }));


    update();

    idController.clear();
    nameController.clear();
    phoneNumberController.clear();

  }

  void editStudent(int index){

    deleteStudent(index);

    String id = idController.text;
    String name = nameController.text ;
    String phoneNumber = phoneNumberController.text;

    studentModel.value.insert(index,StudentModel.formJson({
      "id":id,
      "name":name,
      "phone_number":phoneNumber
    }));


    update();

    idController.clear();
    nameController.clear();
    phoneNumberController.clear();

  }

  void deleteStudent(int index){

    studentModel.value.removeAt(index);
    update();
  }

}