import 'package:flutter/material.dart';
import 'package:travel/widgets/food.dart';

import '../likedplaces/like_button.dart';


class mirzam extends StatelessWidget {
  const mirzam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 480,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.transparent,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image(
                    image: AssetImage('assets/m.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 380,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_outlined),
                      iconSize: 50,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => food()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              //the text label
              Positioned(
                top: 410,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Mirzam Restaurants',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_filled_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                Text(
                  'Time: 9:00 AM - 9:00 PM',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month_sharp,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                Text(
                  'Sunday - Saturday',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Using granite wheels, the roasted beans are ground for days on end, reducing the molecule size to guarantee a creamy and smooth blend of chocolate at the final process.',
              style: TextStyle(fontSize: 20),
            ),
          ),
          LikeButton(place: 'Mirzam'),
        ],
      ),
    );
  }
}
