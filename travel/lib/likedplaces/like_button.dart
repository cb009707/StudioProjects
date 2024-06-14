import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'liked_places_provider.dart.dart';

class LikeButton extends StatelessWidget {
  final String place;

  const LikeButton({required this.place});

  @override
  Widget build(BuildContext context) {
    return Consumer<LikedPlacesProvider>(
      builder: (context, likedPlacesProvider, child) {
        final isLiked = likedPlacesProvider.isLiked(place);

        return IconButton(
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
            size: 30,
          ),
          onPressed: () {
            likedPlacesProvider.togglePlace(place);
          },
        );
      },
    );
  }
}
