import 'package:flutter/material.dart';
import 'package:glassmorphism_effect/glassmorphism_effect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glassmorphism Effect Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Glassmorphism Effect Demo'),
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GMEContainer(
              blur: 5,
              height: 200,
              width: double.infinity,
              linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue.shade300.withOpacity(0.4),
                  Colors.blue.withOpacity(0.2),
                ],
              ),
            ),
          ),
          const GMEListTile(
            leading: FlutterLogo(),
            title: Text("Test"),
            subtitle: Text(
              "Subtitle text",
            ),
            margin: EdgeInsets.all(8),
          ),
        ],
      ),
      // Stack(
      //   children: [
      //     const Positioned(
      //       bottom: 100,
      //       child: FlutterLogo(
      //         size: 100,
      //       ),
      //     ),
      //     Positioned.fill(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: GMEContainer(
      //               blur: 5,
      //               height: 200,
      //               width: double.infinity,
      //               linearGradient: LinearGradient(
      //                 begin: Alignment.topLeft,
      //                 end: Alignment.bottomRight,
      //                 colors: [
      //                   Colors.blue.shade300.withOpacity(0.2),
      //                   Colors.blue.withOpacity(0.1),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           GMEFlexContainer(
      //             blur: 5,
      //             padding: const EdgeInsets.all(8),
      //             linearGradient: LinearGradient(
      //               begin: Alignment.topLeft,
      //               end: Alignment.bottomRight,
      //               colors: [
      //                 Colors.green.shade300.withOpacity(0.3),
      //                 Colors.amber.withOpacity(0.2),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
