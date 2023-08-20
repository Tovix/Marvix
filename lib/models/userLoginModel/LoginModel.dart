class UserModel
{
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;

  UserModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
  }
}
