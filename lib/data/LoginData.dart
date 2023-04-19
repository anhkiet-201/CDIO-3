import '../models/User.dart';

User? user;

Map<String,User> _user = {"igg.anhkiet1@gmail.com":User(name: "Anh Kiệt", pass: "123456", email: "anhKiet")};

bool login_d(String email, String pass){
  if(_user[email] != null){
    if(_user[email]!.pass == pass){
      user = _user[email];
      return true;
    }
  }
  return false;
}

bool signUp_d(User user){
  try{
    _user.addAll({user.email:user});
    return true;
  }catch(e){

  }
  return false;
}