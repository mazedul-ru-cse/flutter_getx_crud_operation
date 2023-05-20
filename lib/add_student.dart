import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_crud/controller/student_controller.dart';

// ignore: must_be_immutable
class AddStudent extends StatelessWidget {
  AddStudent({Key? key}) : super(key: key);

  StudentController studentController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new student"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
          child: getBody()),
    );
  }

  Widget getBody(){

    return Column(

      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: studentController.idController,
            decoration: InputDecoration(
              hintText: "Enter Id",
              labelText: "ID"
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: studentController.nameController,
            decoration: InputDecoration(
                hintText: "Enter name",
                labelText: "Name"
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: studentController.phoneNumberController,
            decoration: InputDecoration(
                hintText: "Enter phone number",
                labelText: "Phone number"
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: (){}, child: Text("Submit")),
        ),

      ],

    );

  }
}
