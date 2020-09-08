import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
  });
}

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

extension AffordabilityExtension on String {
  Affordability getAffordability() {
    switch (this) {
      case "Affordable":
        return Affordability.Affordable;
      case "Pricey":
        return Affordability.Pricey;
      case "Luxurious":
        return Affordability.Luxurious;
      default:
        return null;
    }
  }
}

extension ComplexityExtension on String {
  Complexity getComplexity() {
    switch (this) {
      case "Simple":
        return Complexity.Simple;
      case "Challenging":
        return Complexity.Challenging;
      case "Hard":
        return Complexity.Hard;
      default:
        return null;
    }
  }
}

extension ComplexityGetter on Complexity {
  String getComplexity() {
    switch (this) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }
}

extension AffordabilityGetter on Affordability {
  String getAffordability() {
    switch (this) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }
}
