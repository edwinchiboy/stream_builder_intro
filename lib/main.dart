// import 'package:flutter/material.dart';
// import 'stream.dart';
// import 'dart:async';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Stream',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: StreamHomePage(),
//     );
//   }
// }
//
// class StreamHomePage extends StatefulWidget {
//   const StreamHomePage({super.key});
//
//   @override
//   _StreamHomePageState createState() => _StreamHomePageState();
// }
//
// class _StreamHomePageState extends State<StreamHomePage> {
//   late Stream<int> numberStream;
//
//   @override
//   void initState() {
//     numberStream = NumberStream().getNumbers();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stream'),
//       ),
//       body: StreamBuilder(
//         stream: numberStream,
//         initialData: 0,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             print('Error!');
//           }
//           if (snapshot.hasData) {
//             return Center(
//                 child: Text(
//               snapshot.data.toString(),
//               style: const TextStyle(fontSize: 96),
//             ));
//           } else {
//             return const Center();
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'count_down_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  @override
  _StreamHomePageState createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  late TimerBloc timerBloc;
  int? seconds;

  @override
  void initState() {
    timerBloc = TimerBloc();
    seconds = timerBloc.seconds;
    timerBloc.countDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC'),
      ),
      body: StreamBuilder(
        stream: timerBloc.secondsStream,
        initialData: seconds,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error!');
          }
          if (snapshot.hasData) {
            return Center(
                child: Text(
              snapshot.data.toString(),
              style: const TextStyle(fontSize: 96),
            ));
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
