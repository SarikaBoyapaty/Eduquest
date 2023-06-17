
import 'dart:io';

import 'package:eduquest/common_widgets/text_widget.dart';
import 'package:eduquest/question_papers/question_paper_view.dart';
import 'package:flutter/material.dart';

class SubjectSelect extends StatefulWidget{
  const SubjectSelect(this.userName, this.selectedYearValue, this.selectedBranchValue, this.selectedSemValue);
  final String userName;
  final String selectedYearValue;
  final String selectedBranchValue;
  final String selectedSemValue;
  @override
  State<SubjectSelect> createState() =>SubjectSelectState();
}


class SubjectSelectState extends State<SubjectSelect> {
  String? selectedSubjectValue = null;

  // get dropdownCSE_1_II_Items => null;


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        /* Do something here if you want */
        return false;
      },child:
    Scaffold(
      appBar:  AppBar(
        leading:IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back Icon',
          onPressed: () {
            onBackPressed(context);
          },
        ),
        title: const Text("EduQuest"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        //toolbarHeight: 60.2,
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
        child:(widget.selectedBranchValue =="CSD" && widget.selectedYearValue == "4")||(widget.selectedBranchValue =="CSM" && widget.selectedYearValue == "4") ||  widget.selectedBranchValue == "IT"|| widget.selectedBranchValue == "EEE"?const Center(child: Text("Presently the data isn't available")):
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:  Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(context: context, text:
              '${widget.userName} selected year ${widget.selectedYearValue} , branch ${widget.selectedBranchValue} , sem ${widget.selectedSemValue}'),
              SizedBox(height: 20,),
              ButtonTheme(
                  alignedDropdown: true,
                  child:DropdownButtonFormField
                    (
                    isExpanded: true,
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
                    validator: (value) => value == null ? "Select a country" : null,
                    dropdownColor: Colors.cyanAccent,
                    value: selectedSubjectValue,
                    hint: TextWidget(context: context, text:'Select Subject'),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSubjectValue = newValue!;
                      });
                    },
                    items: showSubjects(),
                    // (widget.selectedBranchValue=="CSE" && widget.selectedYearValue=="4"&&widget.selectedSemValue=="II")?dropdownCSE_4_II_Items:,
                  )),
              SizedBox(height: 20,),
              Container(
                height:500,
                // controller: pdfController,
                //),

              ),

              //questionPaperListView(),
            ],
          ),
        ),
      ),
    ),
    );
  }
  bool _isLoading=false;

  List<DropdownMenuItem<String>> showSubjects() {

    if (widget.selectedBranchValue=="CSE") {
      if( widget.selectedYearValue=="1") {
        if (widget.selectedSemValue == "I") {
          return dropdownCSE_1_I_Items;
        }
        else {
          return dropdownCSE_1_II_Items;
        }
      }
      else if( widget.selectedYearValue=="2") {
        if( widget.selectedSemValue=="I"){
          return dropdownCSE_2_I_Items;}
        else {
          return dropdownCSE_2_II_Items;
        }}
      else if( widget.selectedYearValue=="3") {
        if( widget.selectedSemValue=="I"){
          return dropdownCSE_3_I_Items;}
        else {
          return dropdownCSE_3_II_Items;
        }}
      else if( widget.selectedYearValue=="4") {
        if( widget.selectedSemValue=="I"){
          return dropdownCSE_4_I_Items;}
        else {
          return dropdownCSE_4_II_Items;
        }}
      return List.empty();
    }
    else   if (widget.selectedBranchValue=="CSD") {
      if( widget.selectedYearValue=="1") {
        if (widget.selectedSemValue == "I") {
          return dropdownCSD_1_I_Items;
        }
        else {
          return dropdownCSD_1_II_Items;
        }
      }
      else if( widget.selectedYearValue=="2") {
        if( widget.selectedSemValue=="I"){
          return dropdownCSD_2_I_Items;}
        else {
          return dropdownCSD_2_II_Items;
        }}
      else if( widget.selectedYearValue=="3") {
        if( widget.selectedSemValue=="I"){
          return dropdownCSD_3_I_Items;}
        else {
          return dropdownCSD_3_II_Items;
        }}
      else if( widget.selectedYearValue=="4") {
        if( widget.selectedSemValue=="I"){
          return dropdownCSD_4_I_Items;}
        else {
          return dropdownCSD_4_II_Items;
        }}
      return List.empty();
    }
    else   if (widget.selectedBranchValue=="CSM") {
      if( widget.selectedYearValue=="1") {
        if (widget.selectedSemValue == "I") {
          return dropdownCSM_1_I_Items;
        }
        else {
          return dropdownCSM_1_II_Items;
        }
      }
      else if( widget.selectedYearValue=="2") {
        if( widget.selectedSemValue=="I"){
          return dropdownCSM_2_I_Items;}
        else {
          return dropdownCSM_2_II_Items;
        }}
      else if( widget.selectedYearValue=="3") {
        if( widget.selectedSemValue=="I"){
          return dropdownCSM_3_I_Items;}
        else {
          return dropdownCSM_3_II_Items;
        }}
      else if( widget.selectedYearValue=="4") {
        if( widget.selectedSemValue=="I"){
          return dropdownCSM_4_I_Items;}
        else {
          return dropdownCSM_4_II_Items;
        }}
      return List.empty();
    }
    else{
      return List.empty();
    }
  }
  Widget questionPaperListView() {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  if(selectedSubjectValue!=null) {
                    print("Container clicked");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuestionPaperView(widget.userName,widget.selectedYearValue!,widget.selectedBranchValue!,widget.selectedSemValue!,selectedSubjectValue!)),
                    );
                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  color: Colors.pink.shade100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextWidget(context: context, text:'Entry $index'),
                      Icon(Icons.display_settings_sharp),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
  //CSE
  List<DropdownMenuItem<String>> get dropdownCSE_1_I_Items {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: TextWidget(context: context, text: "Chemistry "),
          value: "Chemistry"),
      DropdownMenuItem(
          child: TextWidget(context: context, text: "Linear Algebra and Multivariable Calculus"),
          value: "Linear Algebra and Multivariable Calculus"),
      DropdownMenuItem(
          child: TextWidget(context: context, text: "Basic Electrical Engineering"),
          value: "Basic Electrical Engineering"),
      DropdownMenuItem(
          child: TextWidget(context: context, text: "Programming for Problem Solving"),
          value: "Programming for Problem Solving"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSE_1_II_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Physics "),value: "Physics "),
      DropdownMenuItem(child: TextWidget(context: context, text:"Numerical Techniques and Transform Calculus"),value: "Numerical Techniques and Transform Calculus"),
      DropdownMenuItem(child: TextWidget(context: context, text:"English"),value: "English"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Engineering Graphic"),value: "Engineering Graphic"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSE_2_I_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Probability and Statistics"),value: "Probability and Statistics"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Digital Logic Design "),value: "Digital Logic Design"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Engineering Mechanics"),value: "Engineering Mechanics"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Data Structures"),value: "Data Structures"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Object Oriented Programming"),value: "Object Oriented Programming"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSE_2_II_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Discrete Mathematics"),value: "Discrete Mathematics"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Managerial Economics and Financial Analysis"),value: "Managerial Economics and Financial Analysis"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Computer Organization and Architecture"),value: "Computer Organization and Architecture"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Operating Systems"),value: "Operating Systems"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Database Management Systems"),value: "Database Management Systems"),

    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSE_3_I_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Fundamentals of Management"),value: "Fundamentals of Management"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Computer Networks"),value: "Computer Networks"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Design and Analysis of Algorithms"),value: "Design and Analysis of Algorithms"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Software Engineering"),value: "Software Engineering"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Advanced Computer Architecture "),value: "Advanced Computer Architecture "),
      DropdownMenuItem(child: TextWidget(context: context, text:"Computer Graphics"),value: "Computer Graphics"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSE_3_II_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Formal Languages and Automata Theory"),value: "Formal Languages and Automata Theory"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Data Mining"),value: "Data Mining"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Web Technologies"),value: "Web Technologies"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Image Processing"),value: "Image Processing"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Machine Learning"),value: "Machine Learning"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Internet of Things"),value: "Internet of Things"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSE_4_I_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Entrepreneurship and Project Management"),value: "Entrepreneurship and Project Management"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Compiler Design"),value: "Compiler Design"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Artificial Intelligence"),value: "Artificial Intelligence"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Distributed Systems"),value: "Distributed Systems"),
      DropdownMenuItem(child: TextWidget(context: context, text:" Soft Computing"),value: " Soft Computing"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Software Testing Methodologies"),value: "Software Testing Methodologies"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Cloud Computing"),value: "Cloud Computing"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Embedded Systems"),value: "Embedded Systems"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSE_4_II_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:" Cryptography & Network Security"),value: " Cryptography & Network Security"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Software Project Management"),value: "Software Project Management"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Information Retrieval Systems"),value: "Information Retrieval Systems"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Data Science using R"),value: "Data Science using R"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Human Computer Interaction"),value: "Human Computer Interaction"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Graph Theory"),value: "Graph Theory"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Ad hoc and Sensor Networks"),value: "Ad hoc and Sensor Networks"),
    ];
    return menuItems;
  }

  //CSD
  List<DropdownMenuItem<String>> get dropdownCSD_1_I_Items {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: TextWidget(context: context, text: "Chemistry "),
          value: "Chemistry"),
      DropdownMenuItem(
          child: TextWidget(context: context, text: "Linear Algebra and Multivariable Calculus"),
          value: "Linear Algebra and Multivariable Calculus"),
      DropdownMenuItem(
          child: TextWidget(context: context, text: "Basic Electrical Engineering"),
          value: "Basic Electrical Engineering"),
      DropdownMenuItem(
          child: TextWidget(context: context, text: "Programming for Problem Solving"),
          value: "Programming for Problem Solving"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSD_1_II_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Physics "),value: "Physics "),
      DropdownMenuItem(child: TextWidget(context: context, text:"Numerical Techniques and Transform Calculus"),value: "Numerical Techniques and Transform Calculus"),
      DropdownMenuItem(child: TextWidget(context: context, text:"English"),value: "English"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Engineering Graphic"),value: "Engineering Graphic"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSD_2_I_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Mathematical Foundations for Data Science"),value:"Mathematical Foundations for Data Science"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Digital Logic and Design"),value:"Digital Logic and Design"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Data Handling & Visualization"),value:"Data Handling & Visualization"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Data Structures using C"),value:"Data Structures using C"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Database Management Systems"),value:"Database Management Systems"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSD_2_II_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Statistical Foundations for Data Science"),value:"Statistical Foundations for Data Science"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Managerial Economics and Financial Analysis"),value:"Managerial Economics and Financial Analysis"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Computer Organization and Architecture"),value:"Computer Organization and Architecture"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Operating Systems"),value:"Operating Systems"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Object Oriented Programming "),value:"Object Oriented Programming "),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSD_3_I_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Fundamentals of Management"),value:"Fundamentals of Management"),
      DropdownMenuItem(child: TextWidget(context: context, text:" Data Mining and Predictive Analytics "),value:" Data Mining and Predictive Analytics "),
      DropdownMenuItem(child: TextWidget(context: context, text:"Computer Networks"),value:"Computer Networks"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Software Engineering"),value:"Software Engineering"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Automata and Compiler Design"),value:"Automata and Compiler Design"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Introduction to Artificial Intelligence"),value: "Introduction to Artificial Intelligence"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSD_3_II_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Design and Analysis of Algorithms"),value:"Design and Analysis of Algorithms"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Introduction to Machine Learning"),value:"Introduction to Machine Learning"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Big Data Analytics"),value:"Big Data Analytics"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Web Development Technologies"),value:"Web Development Technologies"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Computer Vision and Pattern Recognition"),value:"Computer Vision and Pattern Recognition"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Internet of Things and Applications"),value:"Internet of Things and Applications"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSD_4_I_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Entrepreneurship and Project Management"),value:"Entrepreneurship and Project Management"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Data Science using R"),value:"Data Science using R"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Recommender Systems"),value:"Recommender Systems"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Soft Computing"),value:"Soft Computing"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Distributed Databases"),value:"Distributed Databases "),
      DropdownMenuItem(child: TextWidget(context: context, text:"Cloud Computing and Virtualization"),value: "Cloud Computing and Virtualization"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Speech and Natural Language Processing"),value: "Speech and Natural Language Processing"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Information Retrieval Systems"),value: "Information Retrieval Systems"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSD_4_II_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Network Security"),value:"Network Security"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Business Intelligence"),value:"Business Intelligence"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Human Computer Interaction"),value:"Human Computer Interaction"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Digital Forensics "),value:"Digital Forensics "),
      DropdownMenuItem(child: TextWidget(context: context, text:"Software Project Management"),value:"Software Project Management"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Real time systems"),value: "Real time systems"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Neural Networks and Deep Learning "),value: "Neural Networks and Deep Learning "),
    ];
    return menuItems;
  }

  //CSM
  List<DropdownMenuItem<String>> get dropdownCSM_1_I_Items {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: TextWidget(context: context, text: "Chemistry "),
          value: "Chemistry"),
      DropdownMenuItem(
          child: TextWidget(context: context, text: "Linear Algebra and Multivariable Calculus"),
          value: "Linear Algebra and Multivariable Calculus"),
      DropdownMenuItem(
          child: TextWidget(context: context, text: "Basic Electrical Engineering"),
          value: "Basic Electrical Engineering"),
      DropdownMenuItem(
          child: TextWidget(context: context, text: "Programming for Problem Solving"),
          value: "Programming for Problem Solving"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSM_1_II_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Physics "),value: "Physics "),
      DropdownMenuItem(child: TextWidget(context: context, text:"Numerical Techniques and Transform Calculus"),value: "Numerical Techniques and Transform Calculus"),
      DropdownMenuItem(child: TextWidget(context: context, text:"English"),value: "English"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Engineering Graphic"),value: "Engineering Graphic"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSM_2_I_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Probability and Statistics "),value:"Probability and Statistics "),
      DropdownMenuItem(child: TextWidget(context: context, text:"Discrete Mathematics "),value:"Discrete Mathematics "),
      DropdownMenuItem(child: TextWidget(context: context, text:"Digital Logic Design "),value:"Digital Logic Design "),
      DropdownMenuItem(child: TextWidget(context: context, text:"Data Structures using C"),value:"Data Structures using C"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Database Management Systems"),value:"Database Management Systems"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSM_2_II_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Managerial Economics and Financial Analysis"),value:"Managerial Economics and Financial Analysis"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Computer Organization and Architecture"),value:"Computer Organization and Architecture"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Operating Systems"),value:"Operating Systems"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Object Oriented Programming"),value:"Object Oriented Programming"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Introduction to Artificial Intelligence"),value:"Introduction to Artificial Intelligence"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSM_3_I_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Fundamentals of Management"),value:"Fundamentals of Management"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Data Visualization"),value:"Data Visualization"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Computer Networks"),value:"Computer Networks"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Software Engineering"),value:"Software Engineering"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Distributed Systems"),value:"Distributed Systems"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Automata and Compiler design"),value: "Automata and Compiler design"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSM_3_II_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Design and Analysis of Algorithms"),value:"Design and Analysis of Algorithms"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Introduction to Machine Learning"),value:"Introduction to Machine Learning"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Data Mining and Predictive Analytics "),value:"Data Mining and Predictive Analytics "),
      DropdownMenuItem(child: TextWidget(context: context, text:"Web Development Technologies"),value:"Web Development Technologies"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Computer Vision and Pattern Recognition"),value:"Computer Vision and Pattern Recognition"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Internet of Things and Applications"),value: "Internet of Things and Applications"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSM_4_I_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Entrepreneurship and Project Management "),value:"Entrepreneurship and Project Management "),
      DropdownMenuItem(child: TextWidget(context: context, text:"Neural Networks and Deep Learning"),value:"Neural Networks and Deep Learning "),
      DropdownMenuItem(child: TextWidget(context: context, text:"Fuzzy Logic and Applications"),value:"Fuzzy Logic and Applications"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Data Science using R"),value:"Data Science using R"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Big Data Analytics "),value:"Big Data Analytics "),
      DropdownMenuItem(child: TextWidget(context: context, text:"Cloud Computing and Virtualization"),value: "Cloud Computing and Virtualization"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Speech and Natural Language Processing"),value: "Speech and Natural Language Processing"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Information Retrieval Systems"),value: "Information Retrieval Systems"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownCSM_4_II_Items{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: TextWidget(context: context, text:"Network Security "),value:"Network Security "),
      DropdownMenuItem(child: TextWidget(context: context, text:"Game Theory"),value:"Game Theory"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Human Computer Interaction"),value:"Human Computer Interaction"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Digital Forensics "),value:"Digital Forensics "),
      DropdownMenuItem(child: TextWidget(context: context, text:"Software Project Management"),value:"Software Project Management"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Real time systems"),value: "Real time systems"),
      DropdownMenuItem(child: TextWidget(context: context, text:"Augmented and Virtual Reality "),value: "Augmented and Virtual Reality "),
      DropdownMenuItem(child: TextWidget(context: context, text:""),value: ""),
    ];
    return menuItems;
  }
  onBackPressed(BuildContext context)
  {
    Navigator.of(context).pop();
  }
}


