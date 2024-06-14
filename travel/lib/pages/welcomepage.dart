import 'package:flutter/material.dart';
import '../auth/LogIn.dart';

class startpage extends StatelessWidget {
  const startpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/wel.jpg',
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 500),
                const Text(
                  "Welcome Dubai",
                  style: TextStyle(
                    fontFamily: 'Lemon',
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const Text(
                  "Travellers",
                  style: TextStyle(
                    fontFamily: 'Lemon',
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 55),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Log()));
                  },
                  child: Text("Get Started"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
