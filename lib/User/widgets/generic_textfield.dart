import 'package:flutter/material.dart';

class GenericTextField extends StatelessWidget {
  const GenericTextField(
      this.hintText, this.userData, this.inputType, this.icon, this.obscureText,
      {this.width = double.infinity,
        this.borderColor = const Color(0xFFF97147), Key? key})
      : super(key: key);

  final String hintText;
  final TextEditingController userData;
  final TextInputType inputType;
  final IconData icon;
  final bool obscureText;
  final double width;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.only(
        right: 20.0,
        left: 20.0,
      ),
      child: TextField(
        controller: userData,
        keyboardType: inputType,
        obscureText: obscureText,
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFe5e5e5),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: borderColor,
                  width: 1.0,
                )),
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFe5e5e5),
                ),
                borderRadius: BorderRadius.circular(9.0)),
            prefixIcon: Icon(
              icon,
              color: const Color(0xFFF97147),
            )
        ),
      ),
    );
  }
}
