import 'dart:math';

class Iso {
  static Point<int> fromOrtho(Point<num> ortho, Point<num> size) {
    int x = (ortho.x - ortho.y) * (size.x ~/ 2);
    int y = (ortho.x + ortho.y) * (size.y ~/ 4);
    return Point<int>(x, y);
  }

  static Point<int> toOrtho(Point<num> iso, Point<num> size) {
    int x = (iso.x / (size.x / 2) + iso.y / (size.y / 2)) ~/ 2;
    int y = (iso.y / (size.y / 2) - iso.x / (size.x / 2)) ~/ 2;
    return Point<int>(x, y);
  }
}