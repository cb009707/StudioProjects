import 'package:flutter/material.dart';
import 'package:travel/pages/home.dart';
import 'package:travel/pages/settings.dart';

import '../pages/compass.dart';
import '../pages/most_liked_places.dart';
import '../widgets/food.dart';
import '../widgets/mall.dart';


class hotel extends StatelessWidget {
  const hotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blueGrey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  imageBoxes(
                    imageProvider: AssetImage('assets/landmark.png'),
                    label: 'Landmark',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => home()),
                      );
                    },
                  ),
                  imageBoxes(
                    imageProvider: AssetImage('assets/food.png'),
                    label: 'Food',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => food()),
                      );
                    },
                  ),
                  imageBoxes(
                    imageProvider: AssetImage('assets/hotel.png'),
                    label: 'Hotel',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => hotel()),
                      );
                    },
                  ),
                  imageBoxes(
                    imageProvider: AssetImage('assets/mall.png'),
                    label: 'Mall',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => mall()),
                      );
                    },
                  ),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 220),
                    Text(
                      'Top Hotels in Dubai',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
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
                    scroll(
                        '      Atlantis, The Palm ',
                        'Home to the world’s largest waterpark, Atlantis, The Palm is a fun-filled getaway for water lovers of all ages. The smallest travelers will appreciate the vivid underwater frescoes while adults will appreciate the signature Underwater Suites.',
                        'assets/ata.jpg'),
                    scroll(
                        '         Bulgari Resort ',
                        'Situated on a seahorse-shaped island off the coast of Jumeirah, Bulgari Resort Dubai blends European glamor with Middle Eastern tradition. The coral-like awnings are inspired by the region’s intricately carved mashrabiya.',
                        'assets/bul.jpg'),
                    scroll(
                        '         ME Dubai Hotel',
                        'The only hotel to be designed by the late, great Zaha Hadid, ME Dubai Hotel displays her signature style of sinuous structures and organic forms. Housed in the mirrored Opus building in Business Bay, the hotel’s retro-futuristic interiors.',
                        'assets/me.jpg'),
                    scroll(
                        '         Burj Khalifa',
                        'mixed-use skyscraper in Dubai, United Arab Emirates, that is the world’s tallest building, according to all three of the main criteria by which such buildings are judged.Burj Khalifa the world’s tallest building. ',
                        'assets/b.jpeg'),
                    scroll(
                        '         Palm Jumeriah',
                        'Dubai is famous for its soaring skyline – and that’s not the only feat of engineering to capture the world’s imagination. Built from reclaimed land in a series of artificial archipelagos, Palm Jumeirah is shaped like a palm tree when viewed from above. ',
                        'assets/palm.jpg'),
                  ],
                ),
              )
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
      width: 210,
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
                  Container(
                    child: Center(
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
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
          child: Center(
            child: CircleAvatar(
              radius: 25,
              backgroundImage: imageProvider,
            ),
          ),
        ),
        SizedBox(height: 18),
        Text(
          label,
          style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
