import 'package:flutter/material.dart';
import 'package:tyba_test/User/widgets/container_template.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HistoryScreen();
}
class _HistoryScreen extends State<HistoryScreen>{
  @override
  Widget build(BuildContext context) {

    final historyList = Column(
      children: <Widget>[
        const SizedBox(height: 20.0),
        Row(
          children: [
            Container(
              alignment: Alignment.topRight,
              height: 40.0,
              width: 40.0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Color(0xFFa3a5a7), size: 30.0),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 320.0),
          ],
        ),
        const SizedBox(height: 20.0),
        const Text(
          "Search History",
          style: TextStyle(
              color: Colors.black87,
              fontSize: 28.8,
              fontWeight: FontWeight.bold),
        ),
        const ContainerTemplate("27-07-2022","22:32 pm", "Amsterdam"),
        const ContainerTemplate("27-07-2022","22:44 pm", "Venecia"),
        const ContainerTemplate("27-07-2022","22:48 pm", "Cartagena"),
        const ContainerTemplate("27-07-2022","22:55 pm", "Madrid"),
      ],
    );

    return Scaffold(
      body: historyList,
    );
  }
}