import 'package:flutter/material.dart';

class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:20,bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),),
          SizedBox(height: 10),
          Text("Welcome to EduQuest", style: TextStyle(color: Colors.white, fontSize: 18),)
        ],
      ),
    );
  }
}