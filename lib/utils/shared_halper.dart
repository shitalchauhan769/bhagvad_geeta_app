import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  Future<void> setTheme(String ThemeName) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setString("theme", ThemeName);
  }

  Future<String?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    String? theme = shr.getString("theme");
    return theme;
  }

  void setBookmark({required List<String> bookMark}) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setStringList("Url", bookMark);
  }

  Future<List<String>?> getBookmark() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getStringList("Url");
  }
}
