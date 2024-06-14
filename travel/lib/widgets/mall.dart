import 'package:flutter/material.dart';
import 'package:travel/pages/home.dart';
import 'package:travel/pages/settings.dart';

import '../pages/compass.dart';
import '../pages/most_liked_places.dart';
import '../widgets/food.dart';
import '../widgets/hotel.dart';


class mall extends StatelessWidget {
  const mall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blueGrey,
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
                    SizedBox(height: 190),
                    Text(
                      'Top Malls in Dubai',
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
                height: 370,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    scroll(
                        '            Dubai Mall ',
                        'Dubai Mall is a shopping mall in Dubai. It is the second largest mall in the world by total land area and the 26th-largest shopping mall in the world by gross leasable area, tying with West Edmonton Mall and Fashion Island.',
                        'assets/dxbm.jpg'),
                    scroll(
                        '         Emirates Mall ',
                        'Mall of the Emirates is a shopping mall in Dubai. Developed and owned by Majid Al Futtaim Group, it opened in November 2005 and is located at interchange four on Sheikh Zayed Road.',
                        'assets/emi.jpg'),
                    scroll(
                        '         Ibn Battuta Mall',
                        'The Ibn Battuta Mall is a large shopping mall on the Sheikh Zayed Road in Dubai, UAE, close to Interchange 6 for Jabal Ali 1 in southwest Dubai. It opened in 2005 and contains more than 300 stores.',
                        'assets/ibn.jpg'),
                    scroll(
                        '     Dubai Festival City',
                        'A modern business and entertainment area, Dubai Festival City centers on a massive mall of the same name, home to international fashion and furniture brands, global food courts and a cinema complex.',
                        'assets/al.jpg'),
                    scroll(
                        '       City Center Mirdif',
                        'City Centre Mirdif is a shopping mall in the residential area of Mirdif, in Dubai, United Arab Emirates. It opened on 26 March 2010, and is developed and managed by Majid Al Futtaim Properties.',
                        'assets/mird.jpg'),
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
                  SizedBox(height: 4),
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
