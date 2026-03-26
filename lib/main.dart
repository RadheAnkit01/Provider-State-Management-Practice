import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mgmt/pages/favourite/favourite_page.dart';
import 'package:state_mgmt/pages/login_page.dart';
import 'package:state_mgmt/providers/auth_provider.dart';
import 'package:state_mgmt/providers/counter_provider.dart';
import 'package:state_mgmt/providers/favourite_provider.dart';
import 'package:state_mgmt/providers/list_map_provider.dart';
import 'package:state_mgmt/pages/list_page.dart';
import 'package:state_mgmt/theme/theme_changer_provider.dart';
// import 'package:state_mgmt/theme/theme_data.dart';

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
        ChangeNotifierProvider(create: (context) => ThemeChangerProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: Builder(
        builder: (context) {
          final themechanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            // title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              brightness: Brightness.light,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepPurple,
              brightness: Brightness.dark,
            ),
            themeMode: themechanger.getThemeMode,
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  // var isDark = false;

  @override
  Widget build(BuildContext context) {
    final themeChanger = context.watch<ThemeChangerProvider>();
    // print('build Context');
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management (Provider)'),

        // backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 100),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: SingleChildScrollView(
                        child: AlertDialog(
                          title: Center(child: Text('Change Theme')),
                          content: SizedBox(
                            child: RadioGroup<ThemeMode>(
                              groupValue: themeChanger.getThemeMode,
                              onChanged: (value) {
                                if (value != null) {
                                  context.read<ThemeChangerProvider>().setTheme(
                                    value,
                                  );
                                }
                              },
                              child: Column(
                                children: const [
                                  RadioListTile<ThemeMode>(
                                    value: ThemeMode.light,
                                    title: Text('Light Theme'),
                                  ),
                                  RadioListTile<ThemeMode>(
                                    value: ThemeMode.dark,
                                    title: Text('Dark Theme'),
                                  ),
                                  RadioListTile<ThemeMode>(
                                    value: ThemeMode.system,
                                    title: Text('System Theme'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Done'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              title: Text('Change Theme'),
              trailing: Icon(Icons.light_mode),
            ),
          ],
        ),
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
          SizedBox(
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text("Login Page"),
            ),
          ),
        ],
      ),
    );
  }
}
