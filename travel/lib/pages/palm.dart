import 'package:flutter/material.dart';
import 'home.dart';
import '../likedplaces/like_button.dart';

class palm extends StatelessWidget {
  const palm({Key? key}) : super(key: key);

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
                    image: AssetImage('assets/pa.jpeg'),
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
                    'Palm Jumeriah',
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
              'The tree-shaped Palm Jumeirah island is known for glitzy hotels, posh apartment towers and upmarket global restaurants. Food trucks offering snacks in the dot of Palm Jumeirah Boardwalk.',
              style: TextStyle(fontSize: 20),
            ),
          ),
          LikeButton(place: 'Palm Jumeriah'),
        ],
      ),
    );
  }
}
