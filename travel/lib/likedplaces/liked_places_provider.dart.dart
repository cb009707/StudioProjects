import 'package:flutter/foundation.dart';

class LikedPlacesProvider with ChangeNotifier {
  final List<String> _likedPlaces = [];

  List<String> get likedPlaces => _likedPlaces;

  void togglePlace(String place) {
    if (_likedPlaces.contains(place)) {
      _likedPlaces.remove(place);
    } else {
      _likedPlaces.add(place);
    }
    notifyListeners();
  }

  bool isLiked(String place) {
    return _likedPlaces.contains(place);
  }
}
