
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter_svg/flutter_svg.dart';



void main() {
  runApp(const MyApp());
}
String iconExample = 'assets/icons/icons8-app.svg';
String statusConditionText = 'Tu has pulsado el boton esta cantidad:';

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
  int _counter = 6;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if(10 <= _counter)
      {
        statusConditionText ='Haz Ganado!!!';
      }
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
      if(_counter <= 5)
      {
        statusConditionText ='Haz Perdido';
      }
    });
  }
    void _reStarCounter() {
    setState(() {
      _counter=0;
      var logger = Logger();
      logger.d("Logger is working!");
    });
  }
  void _goToDetailScreen(){
      setState(() {
        Navigator.push(context
      , MaterialPageRoute(builder:(context)=> const DetailScreen()),
      );
      
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
            
             const SizedBox(height: 20),
            // SvgPicture.asset(
            //  iconExample,
            //  height: 50,
            //  width: 50,
           //  ),
           Card(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.account_tree_sharp),
                  title: Text('Data Card'),
                  
                ),
                Text (
                  statusConditionText,
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      onPressed: _incrementCounter,
                      child: const Icon(Icons.add)
                    ),
                    TextButton(
                      onPressed: _decrementCounter,
                      child: const Icon(Icons.exposure_minus_1)
                    ),
                    TextButton(
                      onPressed: _reStarCounter,
                      child: const Icon(Icons.exposure_zero)
                    ),
                  ],
                ),
                FloatingActionButton(
                onPressed: _goToDetailScreen,
                child: const Icon(Icons.grain_outlined),
              ),
              ],
              
            )
           )
            
          ],
        ),
      ),   
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  void _goToMainScreen(BuildContext context) {
    Navigator.pop(context);
  }

  void _goToAboutScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AboutScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Pantalla de detalles',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60), 

            // Row con los dos botones
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () => _goToMainScreen(context),
                  child: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
                const SizedBox(width: 20), 
                TextButton(   
                  onPressed: () => _goToAboutScreen(context),
                  child: const Icon(Icons.info_outline_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  void _goToDetailScreen(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Card con texto "Pantalla de información"
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Pantalla de información',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), 

  
            TextButton(
              onPressed: () => _goToDetailScreen(context),
              child: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
