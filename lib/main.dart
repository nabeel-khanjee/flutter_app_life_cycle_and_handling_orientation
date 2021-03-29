import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  AppLifecycleState appLifecycleState;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      appLifecycleState = state;
      print("My App State: $appLifecycleState");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new OrientationBuilder(
          builder: (context, orientation) {
            return new Center(
              child: new Text(
                appLifecycleState.toString(),
                style: new TextStyle(
                  fontSize: 22.0,
                  color: orientation == Orientation.portrait
                      ? Colors.blue
                      : Colors.red,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
