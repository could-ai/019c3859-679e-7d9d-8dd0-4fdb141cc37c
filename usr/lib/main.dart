import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const PlayVerseApp());
}

class PlayVerseApp extends StatelessWidget {
  const PlayVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlayVerse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // Requirement 7: Slide-left/slide-right transitions
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
          },
        ),
        // Requirement 4: Increase button tap targets to 44px height
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(64, 44), 
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            minimumSize: const Size(64, 44),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(64, 44),
          ),
        ),
        // Requirement 1 & 2: AppBar styling (Back button logic is handled by navigation stack)
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
      builder: (context, child) {
        // Requirement 3: Apply 'select-none' (default in Flutter) and 'overscroll-none'
        // We use ScrollConfiguration to remove the glow effect (overscroll indicator)
        return ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: child!,
        );
      },
    );
  }
}
