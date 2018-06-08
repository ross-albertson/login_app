import 'dart:async';

import 'package:login_app/util/network_util.dart';
import 'package:login_app/models/user.dart';

class RestDataSource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final String BASE_URL =
      "http://[2601:247:c301:7d94:7141:9ff9:e2e5:7d09]/login_app_backend";
  static final String LOGIN_URL = BASE_URL + "/login.php";
  static final String _API_KEY = "somerandomkey";

  Future<User> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "token": _API_KEY,
      "username": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if (res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  }
}
