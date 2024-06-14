import 'package:flutter/material.dart';
import 'package:travel/pages/settings.dart';
import '../weather/weatherpage.dart';
import '../widgets/Landmarks.dart';
import '../widgets/food.dart';
import '../widgets/mall.dart';
import '../widgets/hotel.dart';
import 'compass.dart';
import 'most_liked_places.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Welcome Dubai Traveller",
                style: TextStyle(
                  fontFamily: 'BungeeSpice',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => weatherpage()));},
              icon: Icon(Icons.cloud_circle, size: 50, color: Colors.white),
            ),
          ],
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/bu.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 115),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white30,
                      hintText: 'Search.....',
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      imageBoxes(
                        imageProvider: AssetImage('assets/landmark.png'),
                        label: 'Landmark',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
                        },
                      ),
                      imageBoxes(
                        imageProvider: AssetImage('assets/food.png'),
                        label: 'Food',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => food()));
                        },
                      ),
                      imageBoxes(
                        imageProvider: AssetImage('assets/hotel.png'),
                        label: 'Hotel',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => hotel()));
                        },
                      ),
                      imageBoxes(
                        imageProvider: AssetImage('assets/mall.png'),
                        label: 'Mall',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => mall()));
                        },
                      ),
                    ],
                  ),
                  Landmarks(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white60,
          iconSize: 28,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
                break;
              case 1:
                Navigator.push(context, MaterialPageRoute(builder: (context) => CompassPage()));
                break;
              case 2:
                Navigator.push(context, MaterialPageRoute(builder: (context) => settings()));
                break;
              case 3:
                Navigator.push(context, MaterialPageRoute(builder: (context) => MostLikedPlaces()));
                break;
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.compass_calibration),
              label: "Compass",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Most Liked",
            ),
          ],
        ),
      ),
    );
  }
}

Widget imageBoxes({
  required ImageProvider<Object> imageProvider,
  required String label,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Column(
      children: [
        SizedBox(height: 55),
        Container(
          width: 80,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Center(
            child: CircleAvatar(
              radius: 35,
              backgroundImage: imageProvider,
            ),
          ),
        ),
        SizedBox(height: 15),
        Text(
          label,
          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
