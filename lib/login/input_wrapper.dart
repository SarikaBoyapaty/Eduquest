import 'package:eduquest/mainpage/branchyear.dart';
import 'package:flutter/material.dart';


class InputWrapper extends StatefulWidget {

  @override
  State<InputWrapper> createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool enable=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child:  textFields(),
          ),
          SizedBox(height: 40,),
          Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(10),
              ),
              child:
              ElevatedButton(
                onPressed: (enable)? () {
                  _usernameFocusNode.unfocus();
                  _passwordFocusNode.unfocus();
                  if((usernameController.text == "admin" && passwordController.text == "admin")||(usernameController.text == "sarika" && passwordController.text == "sarika"))
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login Success'),
                        )
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  DropdownMenuExample(userName: usernameController.text)),
                    );
                  }
                  else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter proper credentials'),
                        )
                    );
                  }

                }:null,
                style: ElevatedButton.styleFrom(
                  primary: Colors.purpleAccent, // Background color
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 40),
                ),
              )

          ),
        ],
      ),
    );
  }

  Padding textFields() {
    return Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  // padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade200)
                      )
                  ),
                  child: TextField(
focusNode: _usernameFocusNode,
                    controller: usernameController,
                    onChanged: (data) {
                      if (usernameController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        enable = false;
                      } else {
                        enable = true;
                      }
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: "Enter UserName",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Container(
                  // padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade200)
                      )
                  ),
                  child: TextField(
                    controller: passwordController,
                  focusNode: _passwordFocusNode,
                    onChanged: (data) {
                      if (usernameController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        enable = false;
                      } else {
                        enable = true;
                      }
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      hintStyle: TextStyle(color: Colors.grey),
                      // border: InputBorder.none
                    ),
                  ),
                ),
              ],
            ),
          );
  }


}



