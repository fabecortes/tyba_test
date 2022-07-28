import 'package:flutter/material.dart';

class GenericButton extends StatefulWidget {
  const GenericButton(
      this.text,
      this.onPressed,
      {this.color = const Color(0xFFF97147),
        this.width = double.infinity, Key? key}) : super(key: key);

  final String text;
  final Color color;
  final double width;
  final VoidCallback onPressed;

  @override
  State createState() {
    return _GenericButton();
  }
}

class _GenericButton extends State<GenericButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: widget.width,
        child: RawMaterialButton(
          fillColor: widget.color,
          elevation: 2.0,
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          onPressed: () {
            widget.onPressed();
          },
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
