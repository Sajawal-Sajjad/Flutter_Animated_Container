import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Animations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _width = 100.0;
  var _height = 200.0;
  
  BoxDecoration decor = BoxDecoration(
    borderRadius: BorderRadius.circular(2),
    color: Colors.amber,
    
    image: const DecorationImage(
      image: AssetImage('assets/images/off.jpeg'),
      fit: BoxFit.fill,
    ),
  );

  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              width: _width,
              height: _height,
              decoration: decor,
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 2),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (flag) {
                    _width = 500.0;
                    _height = 400.0;
                    decor = BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.amber,
                      image: const DecorationImage(image: AssetImage('assets/images/off.jpeg'))
                    );
                    
                    flag = false;
                  } else {
                    _width = 300.0;
                    _height = 400.0;
                    decor = BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.blueAccent,
                       image: const DecorationImage(image: AssetImage('assets/images/on.jpeg'))
                    );
                    flag = true;
                  }
                });
              },
              child: const Text('Animation'),
            ),
          ],
        ),
      ),
    );
  }
}
