import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget{
  const CardTemplate(this.imageUrl, this.name, this.reviews, this.ranking, {this.top = 20.0, Key? key}) : super(key: key);

  final String imageUrl;
  final String name;
  final String reviews;
  final String ranking;
  final double top;


  @override
  Widget build(BuildContext context) {

    final photo = Container (
      margin: EdgeInsets.only(
          top: top,
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl)
        ),
      ),
    );

    final restaurantDetails = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        const SizedBox(height: 15.0),
        SizedBox(
          width: 250.0,
          child: Text(
          name,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          "$reviews reviews",
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontSize: 8.0,
              color: Color(0xFFa3a5a7)
          ),
        ),
        const SizedBox(height: 5.0),
        Row(
          children: [
          Text(
            ranking,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontSize: 10.0,
                color: Colors.black
            ),
          ),
            const SizedBox(width: 5.0),
          const Icon(
            Icons.star,
            color: Colors.amber,
            size: 15.0,
            )
          ],
        )
      ],
    );

    return Row(
        children: <Widget> [
          const SizedBox(width: 20.0),
          photo,
          const SizedBox(width: 20.0),
          restaurantDetails,
          const SizedBox(width: 20.0),
        ]
    );
  }
}
