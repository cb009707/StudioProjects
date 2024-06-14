import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/pages/welcomepage.dart';
import '../components/darkbutton.dart';
import '../darktheme/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<settings> {
  bool _isDarkModeEnabled = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dark Mode",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                ),
              ),
              SizedBox(height: 16),
              button(
                color: Colors.cyan,
                onTap: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _signOut,
                child: Text("Sign Out"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signOut() async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => startpage()),
      );
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
