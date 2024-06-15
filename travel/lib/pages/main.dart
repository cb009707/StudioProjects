import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../darktheme/provider.dart';
import '../likedplaces/liked_places_provider.dart.dart';
import 'welcomepage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyDmdPouAQdat2Sht-dv7mNthjdMB2gs8xE",
        authDomain: "fir-f0384.firebaseapp.com",
        projectId: "fir-f0384",
        storageBucket: "fir-f0384.appspot.com",
        messagingSenderId: "32107684147",
        appId: "1:32107684147:web:bd7802547e07764695de46"));
  }
  else{
    await Firebase.initializeApp();
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LikedPlacesProvider()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Tourist',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const startpage(),
    );
  }
}
