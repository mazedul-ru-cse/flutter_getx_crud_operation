import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud/add_student.dart';
import 'package:getx_crud/controller/student_controller.dart';

class CRUD extends StatelessWidget {
  CRUD({Key? key}) : super(key: key);

  StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Student Management"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),

      body: Container(
        margin: EdgeInsets.all(10),
          child: getBody()),
    );
  }

  Widget getBody() {

    return Column(


      children: [
        Expanded(
            child: GetBuilder<StudentController>(
              init: StudentController(),
              builder: (controller){
                return ListView.builder(
                  itemCount: controller.studentModel.length,
                    itemBuilder: (context,index){
                     return Card(
                       elevation: 3,
                       child: ListTile(
                         leading: Text(controller.studentModel[index].id.toString()),
                         title: Text(controller.studentModel[index].name),
                         subtitle: Text(controller.studentModel[index].phoneNumber),
                         //trailing: operation(index),
                       ),
                     );
                    }
                );
              }
            )
        ),

        ElevatedButton(onPressed: ()=>Get.to(AddStudent()), child: Text("Add Student")),
      ],

    );
  }
}
