import 'package:flutter/material.dart';
import 'package:tyba_test/User/model/restaurant_model.dart';
import 'package:tyba_test/User/widgets/card_template.dart';

class CardTemplateList extends StatefulWidget{
  const CardTemplateList(this.restaurants, {Key? key}) : super(key: key);

  final List<RestaurantModel> restaurants;

  @override
    State createState() {
      return _CardTemplateList();
  }
}

class _CardTemplateList extends State<CardTemplateList> {

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
             itemCount: widget.restaurants.length,
             itemBuilder: (context, index){
              return CardTemplate(
                  widget.restaurants[index].imageUrl,
                  widget.restaurants[index].name,
                  widget.restaurants[index].reviews,
                  widget.restaurants[index].ranking.split(".")[0],
                top: (index == 0) ? 160 : 20.0,
              );
              },
    );
  }
}
