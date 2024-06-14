import 'package:flutter/material.dart';
import 'package:travel/pages/burj.dart';
import 'package:travel/pages/desert.dart';
import 'package:travel/pages/fish.dart';
import 'package:travel/pages/lamer.dart';
import 'package:travel/pages/palm.dart';

class Landmarks extends StatelessWidget {
  const Landmarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 80),
              Text(
                'Top Landmarks',
                style: TextStyle(
                  fontFamily: 'RubikMaps',
                  fontSize: 35,
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
              landmarkcontainer(
                'Burj Khalifa',
                'assets/burj.jpg',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => burj()),
                  );
                },
              ),
              landmarkcontainer(
                'La Mer',
                'assets/lamer.jpg',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => lamer()),
                  );
                },
              ),
              landmarkcontainer(
                'Desert Safari',
                'assets/desert.jpg',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => desert()),
                  );
                },
              ),
              landmarkcontainer(
                'Dubai Aquarium',
                'assets/aqua.jpg',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => fish()),
                  );
                },
              ),
              landmarkcontainer(
                'Palm Jumeriah',
                'assets/palm.jpg',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => palm()),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget landmarkcontainer(String title, String imagePath, VoidCallback onTap) {
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
                height: 279,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
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
                        fontFamily: 'ShadowsIntoLight',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
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
}
