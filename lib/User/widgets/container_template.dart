import 'package:flutter/material.dart';

class ContainerTemplate extends StatelessWidget {
  const ContainerTemplate(this.date, this.hour, this.citySearched, {Key? key}) : super(key: key);

  final String date;
  final String hour;
  final String citySearched;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const SizedBox(height: 20.0),
        Text(
          date,
          style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w900,
              color: Color(0xFFa3a5a7)
          ),
          textAlign: TextAlign.end,
        ),
        const SizedBox(height: 5.0),
        Container(
          height: 50.0,
          width: 250.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.0),
            color: Colors.grey,
          ),
          child: Row(
            children: [
              const SizedBox(width: 10.0),
              Text(
              hour,
              style: const TextStyle(
                fontSize: 10.0,
                color: Colors.white,
              ),
            ),
              const SizedBox(width: 25.0),
              Text(
                citySearched,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ],
          )
        )
      ],
    );
  }
}

