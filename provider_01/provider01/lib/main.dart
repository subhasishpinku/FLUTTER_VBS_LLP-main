//provider 01
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Counter',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int counter = 0;

//   void increment() {
//     setState(() {
//       counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Counter'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               color: Colors.blue[100],
//               padding: const EdgeInsets.all(20.0),
//               child: const Text(
//                 'MyHomePage',
//                 style: TextStyle(fontSize: 24.0),
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             CounterA(
//               counter: counter,
//               increment: increment,
//             ),
//             const SizedBox(height: 20.0),
//             Middle(counter: counter),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CounterA extends StatelessWidget {
//   const CounterA({
//     required this.counter,
//     required this.increment,
//     super.key,
//   });

//   final int counter;
//   final void Function() increment;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.red[100],
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           Text(
//             '$counter',
//             style: const TextStyle(fontSize: 48.0),
//           ),
//           ElevatedButton(
//             onPressed: increment,
//             child: const Text(
//               'Increment',
//               style: TextStyle(fontSize: 20.0),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Middle extends StatelessWidget {
//   const Middle({
//     required this.counter,
//     super.key,
//   });

//   final int counter;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.grey[200],
//       padding: const EdgeInsets.all(20.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           CounterB(counter: counter),
//           const SizedBox(width: 20.0),
//           const Sibling(),
//         ],
//       ),
//     );
//   }
// }

// class CounterB extends StatelessWidget {
//   const CounterB({
//     required this.counter,
//     super.key,
//   });

//   final int counter;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.yellow[100],
//       padding: const EdgeInsets.all(10.0),
//       child: Text(
//         '$counter',
//         style: const TextStyle(fontSize: 24.0),
//       ),
//     );
//   }
// }

// class Sibling extends StatelessWidget {
//   const Sibling({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.orange[100],
//       padding: const EdgeInsets.all(10.0),
//       child: const Text(
//         'Sibling',
//         style: TextStyle(fontSize: 24.0),
//       ),
//     );
//   }
// }
//provider 02
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:provider01/Model/dog.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Provider(
//       create: (context) => Dog(name: 'Sun', breed: 'Bulldog', age: 3),
//       child: MaterialApp(
//         title: 'Provider 02',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const MyHomePage(),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Provider 02'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               '- name: ${Provider.of<Dog>(context).name}',
//               style: const TextStyle(fontSize: 20.0),
//             ),
//             const SizedBox(height: 10.0),
//             const BreedAndAge(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BreedAndAge extends StatelessWidget {
//   const BreedAndAge({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           '- breed: ${Provider.of<Dog>(context).breed}',
//           style: const TextStyle(fontSize: 20.0),
//         ),
//         const SizedBox(height: 10.0),
//         const Age(),
//       ],
//     );
//   }
// }

// class Age extends StatelessWidget {
//   const Age({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           '- age: ${Provider.of<Dog>(context).age}',
//           style: const TextStyle(fontSize: 20.0),
//         ),
//         const SizedBox(height: 20.0),
//         ElevatedButton(
//           onPressed: () => Provider.of<Dog>(context, listen: false).grow(),
//           child: const Text(
//             'Grow',
//             style: TextStyle(fontSize: 20.0),
//           ),
//         ),
//       ],
//     );
//   }
// }

//provider 04

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:provider01/Model/dog.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<Dog>(
//       create: (context) => Dog(name: 'dog04', breed: 'breed04'),
//       child: MaterialApp(
//         title: 'Provider 04',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const MyHomePage(),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Provider 04'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               '- name: ${Provider.of<Dog>(context).name}',
//               style: const TextStyle(fontSize: 20.0),
//             ),
//             const SizedBox(height: 10.0),
//             const BreedAndAge(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BreedAndAge extends StatelessWidget {
//   const BreedAndAge({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           '- breed: ${Provider.of<Dog>(context).breed}',
//           style: const TextStyle(fontSize: 20.0),
//         ),
//         const SizedBox(height: 10.0),
//         const Age(),
//       ],
//     );
//   }
// }

// class Age extends StatelessWidget {
//   const Age({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           '- age: ${Provider.of<Dog>(context).age}',
//           style: const TextStyle(fontSize: 20.0),
//         ),
//         const SizedBox(height: 20.0),
//         ElevatedButton(
//           onPressed: () => Provider.of<Dog>(context, listen: false).grow(),
//           child: const Text(
//             'Grow',
//             style: TextStyle(fontSize: 20.0),
//           ),
//         ),
//       ],
//     );
//   }
// }

// provider 07
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:provider01/Model/babies.dart';
// import 'package:provider01/Model/dog.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<Dog>(
//           create: (context) => Dog(name: 'dog07', breed: 'breed07', age: 3),
//         ),
//         FutureProvider<int>(
//           initialData: 0,
//           create: (context) {
//             final int dogAge = context.read<Dog>().age;
//             final babies = Babies(age: dogAge);
//             return babies.getBabies();
//           },
//         ),
//         StreamProvider<String>(
//           initialData: 'Bark 0 times',
//           create: (context) {
//             final int dogAge = context.read<Dog>().age;
//             final babies = Babies(age: dogAge * 2);
//             return babies.bark();
//           },
//         ),
//       ],
//       child: MaterialApp(
//         title: 'Provider 07',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const MyHomePage(),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Provider 07'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               '- name: ${context.watch<Dog>().name}',
//               style: const TextStyle(fontSize: 20.0),
//             ),
//             const SizedBox(height: 10.0),
//             const BreedAndAge(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BreedAndAge extends StatelessWidget {
//   const BreedAndAge({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           '- breed: ${context.select<Dog, String>((Dog dog) => dog.breed)}',
//           style: const TextStyle(fontSize: 20.0),
//         ),
//         const SizedBox(height: 10.0),
//         const Age(),
//       ],
//     );
//   }
// }

// class Age extends StatelessWidget {
//   const Age({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           '- age: ${context.select<Dog, int>((Dog dog) => dog.age)}',
//           style: const TextStyle(fontSize: 20.0),
//         ),
//         const SizedBox(height: 10.0),
//         Text(
//           '- number of babies: ${context.watch<int>()}',
//           style: const TextStyle(fontSize: 20.0),
//         ),
//         const SizedBox(height: 10.0),
//         Text(
//           '- ${context.watch<String>()}',
//           style: const TextStyle(fontSize: 20.0),
//         ),
//         const SizedBox(height: 20.0),
//         ElevatedButton(
//           onPressed: () => context.read<Dog>().grow(),
//           child: const Text(
//             'Grow',
//             style: TextStyle(fontSize: 20.0),
//           ),
//         ),
//       ],
//     );
//   }
// }

// provider 09
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Provider 09',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class Foo with ChangeNotifier {
//   String value = 'Foo';

//   void changeValue() {
//     value = value == 'Foo' ? 'Bar' : 'Foo';
//     notifyListeners();
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Provider 09'),
//       ),
//       body: ChangeNotifierProvider<Foo>(
//         create: (_) => Foo(),
//         child: Consumer<Foo>(
//           builder: (BuildContext context, Foo foo, Widget? _) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     foo.value,
//                     style: const TextStyle(fontSize: 40),
//                   ),
//                   const SizedBox(height: 20.0),
//                   ElevatedButton(
//                     onPressed: () => foo.changeValue(),
//                     child: const Text(
//                       'Change Value',
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// provider 11

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'counter.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Provider 11',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ChangeNotifierProvider<Counter>(
//           create: (_) => Counter(),
//           child: Builder(builder: (context) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   '${context.watch<Counter>().counter}',
//                   style: const TextStyle(fontSize: 48.0),
//                 ),
//                 const SizedBox(height: 20.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     context.read<Counter>().increment();
//                   },
//                   child: const Text(
//                     'Increment',
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                 )
//               ],
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
//provider 12
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'counter.dart';
// import 'show_me_counter.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Anonymous Route',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: ChangeNotifierProvider(
//         create: (context) => Counter(),
//         child: const MyHomePage(),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) {
//                     return ChangeNotifierProvider.value(
//                       value: context.read<Counter>(),
//                       child: const ShowMeCounter(),
//                     );
//                   }),
//                 );
//               },
//               child: const Text(
//                 'Show Me Counter',
//                 style: TextStyle(fontSize: 20.0),
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 context.read<Counter>().increment();
//               },
//               child: const Text(
//                 'Increment Counter',
//                 style: TextStyle(fontSize: 20.0),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//provider 13

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'counter.dart';
// import 'show_me_counter.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final Counter _counter = Counter();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Named Route',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       routes: {
//         '/': (context) => ChangeNotifierProvider.value(
//               value: _counter,
//               child: const MyHomePage(),
//             ),
//         '/counter': (context) => ChangeNotifierProvider.value(
//               value: _counter,
//               child: const ShowMeCounter(),
//             ),
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _counter.dispose();
//     super.dispose();
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/counter');
//               },
//               child: const Text(
//                 'Show Me Counter',
//                 style: TextStyle(fontSize: 20.0),
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 context.read<Counter>().increment();
//               },
//               child: const Text(
//                 'Increment Counter',
//                 style: TextStyle(fontSize: 20.0),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// provider 14
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';
import 'show_me_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Counter _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generated Route',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider.value(
                value: _counter,
                child: const MyHomePage(),
              ),
            );
          case '/counter':
            return MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider.value(
                value: _counter,
                child: const ShowMeCounter(),
              ),
            );
          default:
            return null;
        }
      },
    );
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/counter');
              },
              child: const Text(
                'Show Me Counter',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                context.read<Counter>().increment();
              },
              child: const Text(
                'Increment Counter',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
