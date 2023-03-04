import 'package:shared_preferences/shared_preferences.dart';
import 'package:random_quote/features/settings/data/const/shared_preferences_keys.dart';

Future<bool> getWeightHeightMode() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final bool currentMode =
      sharedPreferences.getBool(sharedPreferencesWeightHeightModeKey) ?? true;
  return currentMode;
}
