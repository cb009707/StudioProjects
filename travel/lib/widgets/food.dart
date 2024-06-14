import 'package:flutter/material.dart';
import 'package:travel/pages/home.dart';
import 'package:travel/pages/josette.dart';
import 'package:travel/pages/mirzam.dart';
import 'package:travel/pages/orfali.dart';
import 'package:travel/pages/ossiano.dart';
import 'package:travel/pages/settings.dart';
import 'package:travel/pages/tresind.dart';
import 'package:travel/pages/compass.dart';
import 'package:travel/pages/most_liked_places.dart';
import '../widgets/mall.dart';
import '../widgets/hotel.dart';

class food extends StatelessWidget {
  const food({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bu.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 100),
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
              SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 190),
                    Text(
                      'Top Food Restaurants',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 0),
                height: 360,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    landmarkContainer(
                      'Ossiano',
                      'assets/osa.jpg',
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ossiano()),
                        );
                      },
                    ),
                    landmarkContainer(
                      'Orfali',
                      'assets/ora.jpg',
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => orfali()),
                        );
                      },
                    ),
                    landmarkContainer(
                      'Josette',
                      'assets/jo.jpg',
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => josette()),
                        );
                      },
                    ),
                    landmarkContainer(
                      'Mirzam',
                      'assets/mirz.jpeg',
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => mirzam()),
                        );
                      },
                    ),
                    landmarkContainer(
                      'Tresind',
                      'assets/tre.jpeg',
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => tresind()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white60,
        iconSize: 28,
        showSelectedLabels: true,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
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
    );
  }

  Widget scroll(String title, String description, String imagePath) {
    return Container(
      width: 220,
      margin: EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              height: 137,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
        SizedBox(height: 27),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: imageProvider,
              ),
            ),
          ),
        ),
        SizedBox(height: 18),
        Text(
          label,
          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget landmarkContainer(String title, String imagePath, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 210,
      margin: EdgeInsets.all(8),
      child: Card(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Container(
              height: 287,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
