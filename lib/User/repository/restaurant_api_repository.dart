import 'dart:convert';
import 'package:tyba_test/User/model/restaurant_model.dart';
import 'package:http/http.dart' as http;

class RestaurantApi {

  static Future<List<RestaurantModel>> getRestaurant(String city) async {
    var uri = Uri.https('worldwide-restaurants.p.rapidapi.com', '/search', {
      "language": "en_US",
      "limit": "10",
      "location_id": await getLocation(city),
      "currency": "USD"});
    final response = await http.post(uri, headers: {
      "content-type": "application/x-www-form-urlencoded",
      "X-RapidAPI-Key": "1faf52cd46msh95c12884e569154p1189e2jsn381939d15c03",
      "X-RapidAPI-Host": "worldwide-restaurants.p.rapidapi.com",
      "useQueryString": "true"
    });
    final data = jsonDecode(response.body);
    List<dynamic> temp = [];

    for (var itemData in data ['results']['data']) {
      temp.add(itemData);
    }
    return RestaurantModel.restaurantsFromSnapshot(temp);
  }

  static Future<String> getLocation(String city) async {
    var uri = Uri.https('worldwide-restaurants.p.rapidapi.com', '/typeahead', {
      "q": city,
      "language": "en_US"});
    final response = await http.post(uri, headers: {
      "content-type": "application/x-www-form-urlencoded",
      "X-RapidAPI-Key": "1faf52cd46msh95c12884e569154p1189e2jsn381939d15c03",
      "X-RapidAPI-Host": "worldwide-restaurants.p.rapidapi.com",
      "useQueryString": "true"
    });
    final data = jsonDecode(response.body);
    String locationId = data['results']['data'][0]['result_object']['location_id'];
    return locationId;
  }
}
