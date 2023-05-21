class StudentModel{

  late String id;
  late String name;
  late String phoneNumber;

  StudentModel(this.id, this.name, this.phoneNumber);

  StudentModel.formJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
  }

  Map<String,dynamic> toJson(){
    return{
    "id" : id,
    "name" : name,
    "phone_number" : phoneNumber
    };
  }

}