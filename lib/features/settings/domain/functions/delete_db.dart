import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:random_quote/features/common/toast/success.dart';
import 'package:random_quote/features/history/domain/providers.dart';
import 'package:random_quote/features/homepage/data/const/shared_preferences_keys.dart';

Future<void> deleteDatabase(WidgetRef ref) async {
  await SharedPreferences.getInstance()
      .then((SharedPreferences sharedPreferences) {
    sharedPreferences.setString(sharedPreferencesBMIHistoryKey, '[]');
  }).whenComplete(() {
    successToast('History deleted');
    return ref.refresh(transactionHistoryProvider);
  });
}
