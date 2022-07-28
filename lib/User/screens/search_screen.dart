import 'package:flutter/material.dart';
import 'package:tyba_test/User/model/restaurant_model.dart';
import 'package:tyba_test/User/repository/restaurant_api_repository.dart';
import 'package:tyba_test/User/widgets/card_template_list.dart';
import 'package:tyba_test/User/widgets/header.dart';

class SearchScreen extends  StatefulWidget{
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {

  late List<RestaurantModel> _restaurants;
  bool isLoading = true;

  Future<void> getRestaurants(String city) async {
    _restaurants = await RestaurantApi.getRestaurant(city);
    setState ((){
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: <Widget>[
        if (isLoading) const Center(child: CircularProgressIndicator())
        else CardTemplateList(_restaurants),
        Header((city){getRestaurants(city);}),
      ],
      ),
    );
  }
}
