import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../likedplaces/like_button.dart';

import '../likedplaces/liked_places_provider.dart.dart';

final Map<String, String> placeImageMap = {
  'Burj Khalifa': 'assets/kha.jpg',
  'La Mer': 'assets/la.jpg',
  'Ossanio': 'assets/os.jpeg',
  'Dubai Aquarium': 'assets/aqua.jpg',
  'Hotel': 'assets/hotel.png',
  'Orafali': '  assets/or.jpg',
  'Desert Safari': 'assets/desert.jpg',
  'Palm Jumeriah': 'assets/palm.jpg',
  'Mirzam': 'assets/mirz.jpeg',
  'Tresind': 'assets/tre.jpeg',
  'Josette': 'assets/jo.jpg',
};

class MostLikedPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Consumer<LikedPlacesProvider>(
        builder: (context, likedPlacesProvider, child) {
          return ListView.builder(
            itemCount: likedPlacesProvider.likedPlaces.length,
            itemBuilder: (context, index) {
              final place = likedPlacesProvider.likedPlaces[index];
              final imagePath = placeImageMap[place] ?? 'assets/default.jpg';

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        imagePath,
                        width: 70,
                        height: 700,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      place,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    trailing: LikeButton(place: place),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
