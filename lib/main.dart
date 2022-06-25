import 'package:flutter/material.dart';
import 'package:my_app/theme/app_theme/dark_theme.dart';
import 'package:my_app/theme/app_theme/i_theme.dart';
import 'package:my_app/theme/app_theme/light_theme.dart';
import 'package:my_app/theme/theme_manager.dart';

void main() {
  final ThemeManager theme = ThemeManager();
  theme.initTheme(LightTheme());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([ThemeManager()]),
      builder: (context, childe){
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeManager().myTheme,
          darkTheme: ThemeManager().myTheme,
          themeMode: ThemeManager().mode,
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => SecondPage())));
    // setState(() {
    //   _counter++;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: ThemeManager().theme?.style[ThemeTextStyle.body]
            ),
            Text(
              '$_counter',
              style: ThemeManager().theme?.style[ThemeTextStyle.body]
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    print('second page');
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Second Page'),
            ElevatedButton(
              onPressed: () {
                ThemeManager().initTheme(DarkTheme());
              },
              child: Text('Dark Mode'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ThemeManager().initTheme(LightTheme());
              },
              child: Text('Lite Mode'),
            ),
          ],
        ),
      ),
    );
  }
}
