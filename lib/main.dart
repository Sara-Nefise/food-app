import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';
import 'package:foodapp/firebase_options.dart';
import 'package:foodapp/home.dart';
import 'package:riverpod_context/riverpod_context.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bot_toast/bot_toast.dart';

var currentIndex = StateProvider((ref) => 0);
StateProvider<int> selectedIndex = StateProvider((ref) => 0);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: InheritedConsumer(child: MyApp())));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.lightBlue[800],
            fontFamily: GoogleFonts.roboto().toString(),
            textTheme: GoogleFonts.robotoTextTheme(textTheme).copyWith(
              displayLarge: GoogleFonts.ibarraRealNova(
                  textStyle: textTheme.displayLarge,
                  fontSize: 59,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: AppColors.black),
              displayMedium: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackPearl),
              displaySmall: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackPearl),
              bodySmall: const TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  color: AppColors.midGrey,
                  fontWeight: FontWeight.w500),
              bodyMedium: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400),
            )),
        home: AppNavigation()
        // testscreen(),
        );
  }
}
