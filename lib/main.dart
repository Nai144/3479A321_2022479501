import 'package:flutter/material.dart';
import 'package:logger/logger.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.   

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        fontFamily:'Decaydence', 
        textTheme: const TextTheme(
          displayLarge:  TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge:  TextStyle( 
            fontFamily: 'Decaydence',
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
        
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 8, 230, 126)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mi Aplicación'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      var logger = Logger();
      logger.d("Logger is working!");
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
    void _reStarCounter() {
    setState(() {
      _counter=0;
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
              'Tu has pulsado el boton esta cantidad:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildButtonIncrement(),
          const SizedBox(height: 16), // Espacio entre los botones
          _buildButtonDecrement(),
          const SizedBox(height: 16),
          _buildButtonReStart()
        ],
      ),  
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  FloatingActionButton _buildButtonReStart() {
    return FloatingActionButton(
          onPressed: _reStarCounter,
          tooltip: 'Restart',
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          ),
          child: const Icon(Icons.exposure_zero),
        );
  }

  FloatingActionButton _buildButtonDecrement() {
    return FloatingActionButton(
          onPressed: _decrementCounter,
          tooltip: 'Decrement',
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          ),
          child: const Icon(Icons.exposure_minus_1),
        );
  }

  FloatingActionButton _buildButtonIncrement() {
    return FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          ),
          child: const Icon(Icons.plus_one),
          
        );
  }
}
