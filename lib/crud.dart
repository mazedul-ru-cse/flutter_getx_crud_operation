import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud/add_student.dart';
import 'package:getx_crud/controller/student_controller.dart';
import 'package:getx_crud/edit_student.dart';
import 'package:getx_crud/model/StudentModel.dart';

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
              builder: (_){
                return ListView.builder(
                  itemCount: studentController.studentModel.length,
                    itemBuilder: (context,index){
                     return Card(
                       elevation: 3,
                       child: ListTile(
                         leading: Text(studentController.studentModel[index].id.toString()),
                         title: Text(studentController.studentModel[index].name),
                         subtitle: Text(studentController.studentModel[index].phoneNumber),
                         trailing: operation(index,studentController.studentModel[index]),
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


  Widget operation(index,StudentModel studentModel){

    return SizedBox(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(onPressed: ()=>studentController.deleteStudent(index), icon: Icon(Icons.delete,color: Colors.red,)),
          IconButton(onPressed: (){
            studentController.idController.text = studentModel.id;
            studentController.nameController.text = studentModel.name;
            studentController.phoneNumberController.text = studentModel.phoneNumber;
            Get.to(EditStudent(index: index));

            }, icon: Icon(Icons.edit,color: Colors.grey,)),
        ],
      ),
    );
  }

}
