import 'package:flutter/material.dart';
import 'package:flutter_version/pages/favourites_page.dart';
import 'package:flutter_version/pages/homepage.dart';
import 'package:flutter_version/pages/intro_page.dart';
import 'package:flutter_version/pages/profile_settings.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final ColorScheme helloFresh = const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromRGBO(109, 162, 83, 255),
    onPrimary: Color.fromRGBO(213, 226, 156, 255),
    secondary: Color.fromRGBO(247, 195, 70, 255),
    onSecondary: Color.fromRGBO(247, 195, 70, 255),
    error: Color.fromRGBO(219, 55, 62, 255),
    onError: Colors.black,
    background: Colors.white,
    onBackground: Color.fromRGBO(153, 196, 98, 255),
    surface: Colors.white,
    onSurface: Color.fromRGBO(153, 196, 98, 255),
  );

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RecipeApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light, colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(109, 162, 83, 255)), fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w500).fontFamily),
      navigatorKey: MyApp.navigatorKey,
      home: const IntroPage(), //check if persisted login, then go to home page, if not go to register / login page
      initialRoute: '/',
      routes: {
        '/home': (context) => const HomePage(),
        '/favorites': (context) => const FavouritesPage(),
        '/profile': (context) => const ProfileSettingsPage(),
      },
    );
  }

}




/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
