import 'package:chem/animation/fade_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String hintText;
  final Color fillColor;
  final TextInputType keyBoardType;
  final Function onChanged;
  final TextEditingController controller;
  final double delay;

  ReusableTextField(
      {@required this.hintText, this.fillColor, this.keyBoardType,this.onChanged,this.controller,@required this.delay});

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(delay,
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: TextFormField(
            controller: controller,
            onChanged: this.onChanged,
            textAlign: TextAlign.center,
            keyboardType: keyBoardType,
            style: TextStyle(fontSize: 25, color: Colors.black),
            decoration: InputDecoration(
              fillColor: fillColor,
              filled: true,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 22, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
