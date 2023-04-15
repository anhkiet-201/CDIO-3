import '../models/User.dart';

User? user;

bool login_d(String userName, String pass){
  if(userName == 'igg.anhkiet1@gmail.com' && pass == '12345678') {
    user = User(name: 'Hồ Anh Kiệt', pass: 'pass', userName: 'userName');
    return true;
  }
  return false;
}