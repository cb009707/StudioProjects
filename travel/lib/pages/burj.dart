import 'package:flutter/material.dart';
import '../likedplaces/like_button.dart';
import 'home.dart';


class burj extends StatelessWidget {
  const burj({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      image: AssetImage('assets/kha.jpg'),
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
                //  the text label
                Positioned(
                  top: 400,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'Burj Khalifa',
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
                'Burj Khalifa, mixed-use skyscraper in Dubai, United Arab Emirates, that is the world’s tallest building, according to all three of the main criteria by which such buildings are judged.',
                style: TextStyle(fontSize: 20),
              ),
            ),
            LikeButton(place: 'Burj Khalifa'),
          ],
        ),
      ),
    );
  }
}
