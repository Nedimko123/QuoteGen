import 'package:random_quote/features/homepage/domain/providers.dart';
import 'package:random_quote/features/settings/domain/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void refreshHeightWeight(WidgetRef ref) {
  ref.invalidate(isAmericanModeProvider);
  ref.invalidate(weightProvider);
  ref.invalidate(heightProvider);
}
