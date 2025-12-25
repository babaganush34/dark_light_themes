import 'package:flutter/material.dart';

void main() => runApp(ThemeApp());

class ThemeApp extends StatefulWidget {
  const ThemeApp({super.key});

  @override
  State<ThemeApp> createState() => ThemeAppState();
}

class ThemeAppState extends State<ThemeApp> {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      themeMode = themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme',
      themeMode: themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color.fromARGB(255, 195, 195, 195),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 127, 127, 127),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 127, 127, 127),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.blueGrey,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black.withOpacity(0.5),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor:Colors.black.withOpacity(0.5),
        ),
      ),
      home: HomePage(
        onToggleTheme: toggleTheme, 
        themeMode: themeMode,
        ),
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;

  const HomePage({
    super.key,
    required this.onToggleTheme,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' ThemeData & ThemeMode')),
      floatingActionButton: FloatingActionButton(
        onPressed: onToggleTheme,
        child: Icon(
          themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
          color: themeMode == ThemeMode.light ? Colors.black87 : Colors.blueGrey,
        ),
      ),
      body: Center(
        child: Text(
          themeMode == ThemeMode.light ? 'Светлая тема' : 'Темная тема',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
