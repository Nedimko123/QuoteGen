import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/notifications/functions/init.dart';
import 'package:random_quote/features/settings/domain/functions/activate_quote_notifications.dart';
import 'package:random_quote/features/settings/domain/providers.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:workmanager/workmanager.dart';

import 'features/introduction_screen/presentation/pages/intro_main.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      await activateQuoteNotifications();
    } catch (e) {
      //everything should be ok
    }
    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(
    callbackDispatcher,
  );
  Workmanager().registerPeriodicTask(
    "quoteGeneration",
    "quoteGeneration",
    frequency: const Duration(hours: 23),
  );
  await initNotifications();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final themeMode = ref.watch(isDarkModeProvider);
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'QuoteGen',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
          darkTheme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: Colors.indigo,
              brightness: Brightness.dark),
          themeMode: themeMode.maybeWhen(
              data: (themeMode) => themeMode ? ThemeMode.dark : ThemeMode.light,
              orElse: () => ThemeMode.dark),
          home: const IntroductionScreenMain(),
        );
      },
    );
  }
}
