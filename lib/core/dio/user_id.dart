
import '../shared_preferences/cach_helper.dart';

class UserData {
  static String? token;
  static String? lang;
  static bool isGhost = false;
  static init() async {
    token = await CacheHelper.getSaveData(key: "token");
    lang = await CacheHelper.getSaveData(key: "LOCALE");

    if (await CacheHelper.getSaveData(key: "ghost") != null) {
      isGhost = await CacheHelper.getSaveData(key: "ghost");
    }
  }

  static initLang() async {
    lang = await CacheHelper.getSaveData(key: "LOCALE");
  }
}
