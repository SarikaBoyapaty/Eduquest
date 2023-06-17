import 'package:eduquest/common_widgets/text_widget.dart';
import 'package:eduquest/login/input_wrapper.dart';
import 'package:flutter/material.dart';
import 'header.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title:  TextWidget(context: context, text:"EduQuest"),

        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor:Colors.purple.shade100,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.purpleAccent,
        child: Column(
          children: <Widget>[
            SizedBox(height: 80,),
            Header(),
            Expanded(child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(60,20),
                    topRight: Radius.elliptical(60,20),
                  )
              ),
              child: InputWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}