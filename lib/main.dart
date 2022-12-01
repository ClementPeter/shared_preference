import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


// 2nd DEMO SHARED PREFERENCE - PERSONAL 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Shared Preferencese'),
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readCounter();
  }

  int _counter = 0;
  int _oldValue = 0;

  //Read Saved counter Value from shared preference
  void readCounter() async {
    final preference = await SharedPreferences.getInstance();

    setState(() {
      _oldValue = preference.getInt("counterKey") ?? 0;
      //  _counter = preference.getInt("counterKey")!;
    });
  }

  //Increment counter and save value to shared preference
  void _incrementCounter() async {
    final preference = await SharedPreferences
        .getInstance(); //Create Shared Preference Instance

    setState(() {
      _counter++;
      preference.setInt("counterKey", _counter);
    });
    //readCounter();
  }

  //Decrement counter and save value to shared preference
  void _decrementCounter() async {
    final preference = await SharedPreferences
        .getInstance(); //Create Shared Preference Instance

    setState(() {
      _counter--;
      preference.setInt("counterKey", _counter);
    });
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
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 20),
            Text(
              'Current counter value : $_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Old value stored in Shared Preference : $_oldValue',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}














//Destiny  Ed Tutorial Saving and Reading Counter value from shared preference

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     readCounter();
//   }

//   int _counter = 0;

//   //Read Saved counter Value from shared preference
//   void readCounter() async {
//     final preference = await SharedPreferences.getInstance();

//     setState(() {
//       _counter = preference.getInt("counterKey")!;
//     });
//   }

//   //Increment counter and save value to shared preference
//   void _incrementCounter() async {
//     final preference = await SharedPreferences
//         .getInstance(); //Create Shared Preference Instance

//     setState(() {
//       _counter++;
//       preference.setInt("counterKey", _counter);
//       readCounter();
//     });
//   }

//   //Decrement counter and save value to shared preference
//   void _decrementCounter() async {
//     final preference = await SharedPreferences
//         .getInstance(); //Create Shared Preference Instance

//     setState(() {
//       _counter--;
//       preference.setInt("counterKey", _counter);
//       readCounter();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'Current counter value : $_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           FloatingActionButton(
//             onPressed: _incrementCounter,
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             onPressed: _decrementCounter,
//             tooltip: 'Increment',
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }
