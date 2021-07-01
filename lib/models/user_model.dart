class UserModel {
  String name;
  String uId;
  String email;
  String phone;

  UserModel({
    this.uId,
    this.name,
    this.phone,
    this.email
  });

  UserModel.fromJson(Map<String, dynamic> json)
  {
    uId = json['uId'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }

  //create map
  Map<String, dynamic> toMap()
  {
    return
      {
        'uId': uId,
        'name': name,
        'email': email,
        'phone': phone,
      };
  }
}
