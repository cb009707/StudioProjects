import 'package:flutter/material.dart';
import 'home.dart';
import '../likedplaces/like_button.dart';

class desert extends StatelessWidget {
  const desert({Key? key}) : super(key: key);

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
                    image: AssetImage('assets/d.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 390,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_outlined),
                      iconSize: 50,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => home()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              // the text label
              Positioned(
                top: 400,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Desert Safari',
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
              'You have come to the right place if you are looking for a thrill, fun, and ultimate outdoor adventure entertainment. Desert Safari Dubai is all this, plus much more. The duel between rolling red dunes.',
              style: TextStyle(fontSize: 20),
            ),
          ),
          LikeButton(place: 'Desert Safari'),
        ],
      ),
    );
  }
}
