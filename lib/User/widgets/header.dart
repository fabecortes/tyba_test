import 'package:flutter/material.dart';
import 'package:tyba_test/User/screens/history_screen.dart';
import 'package:tyba_test/User/widgets/generic_button.dart';
import 'package:tyba_test/User/widgets/generic_textfield.dart';

class Header extends StatelessWidget {
  const Header(this.onSearched, {Key? key}) : super(key: key);

  final ValueChanged <String> onSearched;

  @override
  Widget build(BuildContext context) {

    final userCityController = TextEditingController();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = 270.0;

    final headerWidgets = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 20.0),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: 40.0,
              width: 40.0,
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.white, size: 30.0),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HistoryScreen()
                      )
                  );
                },
              ),
            ),
          const SizedBox(width: 310.0),
          Container(
            alignment: Alignment.topRight,
            height: 40.0,
            width: 40.0,
            child: IconButton(
              icon: const Icon(Icons.logout, color: Colors.white, size: 30.0),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),
        ],
        ),
        const Text(
                "What's your city?",
                style: TextStyle(
                color: Colors.white,
                fontSize: 28.8,
                fontWeight: FontWeight.bold),
          ),
        const SizedBox(height: 20.0),
        GenericTextField(
          "City",
          userCityController,
          TextInputType.text,
          Icons.search,
          false,
          borderColor: Colors.grey,
        ),
          GenericButton(
              "Search",
              color: const Color(0xFFF97147),
              width: 120.0,
                  () {onSearched(userCityController.text);}
          )
      ],
    );

    return Stack(
      children: <Widget>[
        Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
              color: Colors.grey
          ),
        ),
        headerWidgets
      ],
    );
  }
}
