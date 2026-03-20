import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mgmt/pages/favourite/favourite_page.dart';
import 'package:state_mgmt/providers/counter_provider.dart';
import 'package:state_mgmt/providers/favourite_provider.dart';
import 'package:state_mgmt/providers/list_map_provider.dart';
import 'package:state_mgmt/pages/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => ListMapProvider()),
        ChangeNotifierProvider(create: (context) => FavouriteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.cyan)),

        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // print('build Context');
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management (Provider)'),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListPage()),
                  );
                },
                child: Text('List'),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavouritePage()),
                  );
                },
                child: Text('Favourite'),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
