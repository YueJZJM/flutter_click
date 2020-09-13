import 'package:shared_preferences/shared_preferences.dart';

class UserUtil{
  static const String SP_USER_ID = "sp_user_id";
  static const String SP_USER_NAME = "sp_user_name";
  static const String SP_USER_NICK = "sp_user_nick";
  static const String SP_USER_HEADURL = "sp_user_headurl";
  static const String SP_USER_DESC = "sp_user_desc";
  static const String SP_USER_URL = "sp_user_url";
  static const String SP_USER_GENDER = "sp_user_gender";
  static const String SP_USER_FAN = "sp_user_fan";
  static const String SP_USER_FOLLOW = "sp_user_follow";
  static const String SP_USER_ISMEMBER = "sp_user_ismember";
  static const String SP_USER_ISVERTIFY = "sp_user_isvertify";

  static const String SP_IS_ALLOGIN = "sp_is_allogin";

  static saveUser(Map data){

  }

  static Future<bool> isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLogin = prefs.getBool(SP_IS_ALLOGIN);
    return isLogin;
  }
}