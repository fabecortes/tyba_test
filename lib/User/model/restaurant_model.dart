import 'package:flutter/material.dart';


class RestaurantModel {
  final String imageUrl;
  final String name;
  final String reviews;
  final String ranking;

  RestaurantModel ({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.reviews,
    required this.ranking,
  });

  factory RestaurantModel.fromJson(dynamic json){
    return RestaurantModel(
      imageUrl: json ['photo']['images']['small']['url'] as String,
      name: json['name'] as String,
      reviews: json['num_reviews'] as String,
      ranking: json['raw_ranking'] as String,
    );
  }

  static List<RestaurantModel> restaurantsFromSnapshot(List snapshot){
    return snapshot.map((data){
          return RestaurantModel.fromJson(data);
        }
    ).toList();
  }

  @override
  String toString(){
    return 'Restaurant{name:$imageUrl, $name, $reviews, $ranking}';
  }

}