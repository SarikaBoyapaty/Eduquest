import 'dart:io';

import 'package:eduquest/common_widgets/text_widget.dart';
import 'package:eduquest/subject/subject_select.dart';
import 'package:flutter/material.dart';

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({required this.userName, super.key});
  final String userName;
  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String? selectedYearValue = null;
  List<DropdownMenuItem<String>> get dropdown_year_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(value: "1", child:TextWidget(context: context, text:"I Year")),
      DropdownMenuItem(value: "2", child: TextWidget(context: context, text: 'II Year',)),
      DropdownMenuItem(value: "3", child:TextWidget(context: context, text: 'III Year',)),
      DropdownMenuItem(value: "4", child: TextWidget(context: context, text: 'IV Year',)),
    ];
    return menuItems;
  }
  String? selectedBranchValue = null;
  String? selectedSemValue = null;

  List<DropdownMenuItem<String>> get dropdown_Branch_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"CSE"),value: "CSE"),
      DropdownMenuItem(child: TextWidget(context: context, text:"CSD"),value: "CSD"),
      DropdownMenuItem(child: TextWidget(context: context, text:"CSM"),value: "CSM"),
      DropdownMenuItem(child: TextWidget(context: context, text:"CST"),value: "CST"),
      DropdownMenuItem(child: TextWidget(context: context, text:"IT"),value: "IT"),
      DropdownMenuItem(child: TextWidget(context: context, text:"EEE"),value: "EEE"),
      DropdownMenuItem(child: TextWidget(context: context, text:"ECE"),value: "ECE"),
      DropdownMenuItem(child: TextWidget(context: context, text:"ETE"),value: "ETE"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdown_Sem_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"I"),value: "I"),
      DropdownMenuItem(child: TextWidget(context: context, text:"II"),value: "II"),
    ];
    return menuItems;
  }
  @override
  Widget build(BuildContext context) {


    return
      WillPopScope(
        onWillPop: () async {
          /* Do something here if you want */
          return false;
        },
        child: Scaffold(
          appBar:  AppBar(
            title: TextWidget(context: context, text:"EduQuest"),
            automaticallyImplyLeading: false,
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
          body: SafeArea(
            child: Column(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.cyanAccent, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.cyanAccent, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor: Colors.cyanAccent,
                              ),
                              validator: (value) => value == null ? "Select Year" : null,
                              dropdownColor: Colors.cyanAccent,
                              value: selectedYearValue,
                              hint: TextWidget(context: context, text:'Select Year'),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedYearValue = newValue!;
                                });
                              },
                              items: dropdown_year_Items),
                        ),
                      ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:ButtonTheme(
                        alignedDropdown: true,
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red.shade100, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                            fillColor: Colors.redAccent[100],
                          ),
                          validator: (value) => value == null ? "Select Branch" : null,
                          dropdownColor: Colors.redAccent[100],
                          value: selectedBranchValue,
                          hint: TextWidget(context: context, text:'Select Branch'),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedBranchValue = newValue!;
                            });
                          },
                          items: dropdown_Branch_Items),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ButtonTheme(
                        alignedDropdown: true,
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:  BorderSide(color: Colors.deepPurple.shade100, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                            fillColor: Colors.deepPurple.shade100,
                          ),
                          validator: (value) => value == null ? "Select Sem" : null,
                          dropdownColor: Colors.deepPurple.shade100,

                          value: selectedSemValue,
                          hint: TextWidget(context: context, text:'Select Sem'),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedSemValue = newValue!;
                            });
                          },
                          items: dropdown_Sem_Items),
                    ),
                  ),


                    ],
                  ),
                ),
                if (selectedYearValue != null && selectedBranchValue != null && selectedSemValue !=null)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          '${widget.userName} selected year $selectedYearValue , branch $selectedBranchValue , sem $selectedSemValue'),
                      navigateToNextScreen(true)
                    ],
                  )
                else
                  Column(
                    children:  [
                      const Text('Please select all entries'),
                      navigateToNextScreen(false)
                      // Align(
                      //     alignment: Alignment.centerRight,child: Icon(Icons.arrow_circle_right,
                      //   color: Colors.black12,
                      //     size: 50))
                    ],
                  )
              ],
            ),
          ),
        ),
      );
  }

  Align navigateToNextScreen(bool isEnable) {
    return  Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right:20.0),
                          child: IconButton(
                            icon: Icon(Icons.arrow_circle_right,color: isEnable?Colors.purpleAccent:Colors.black12,
                            size: 50,), onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  SubjectSelect(widget.userName,selectedYearValue!,selectedBranchValue!,selectedSemValue!)),
                            );
                          },
                          ),
                        ));
  }
}


