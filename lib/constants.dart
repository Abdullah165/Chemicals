import 'package:flutter/material.dart';


const kTextFieldLabelStyle = TextStyle(fontSize: 25,color: Colors.white);

const kAppBodyColor = Color(0xff1A455B);
const kCardTextFieldColor = Color(0xffA8BCD9);

const kTextFieldInputDecorationStyle = InputDecoration(
  hintText: 'Search',
  hintStyle: TextStyle(fontSize: 25,color: Colors.white70),
  prefixIcon: Icon(Icons.search,size: 25,color: Colors.white70,),
  filled: true,
  fillColor: Color(0xff546E7A),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30.0),
    ),
    borderSide: BorderSide.none,
  ),
);