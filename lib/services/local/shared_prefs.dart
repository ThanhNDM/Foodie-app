import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  final String keyAvatar = 'avatar';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String?> getAvatarPath() async {
    SharedPreferences prefs = await _prefs;
    String? avatarPath = prefs.getString(keyAvatar);
    return avatarPath;
  }

  Future<void> saveAvatarPath(String avatarPath) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString(keyAvatar, avatarPath);
  }
}
