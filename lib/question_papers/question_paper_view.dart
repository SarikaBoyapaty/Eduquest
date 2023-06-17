import 'package:eduquest/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class QuestionPaperView extends StatelessWidget{
  const QuestionPaperView(this.userName, this.selectedYearValue, this.selectedBranchValue, this.selectedSemValue,this.selectedSubjectValue);
  final String userName;
  final String selectedYearValue;
  final String selectedBranchValue;
  final String selectedSemValue;
  final String selectedSubjectValue;
  @override
  Widget build(BuildContext context) {
   return MaterialApp(home: Scaffold(
         appBar:
         AppBar(
           title: const Text("EduQuest"),
           leading:
             IconButton(
               icon: const Icon(Icons.arrow_back),
               tooltip: 'Back Icon',
               onPressed: () {
                 onBackPressed(context);
               },
             ),
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
         body: Column(
           children: [
             TextWidget(context: context, text:
             '${userName} selected year ${selectedYearValue} , branch ${selectedBranchValue} , sem ${selectedSemValue} , Subject ${selectedSubjectValue}'),
             SizedBox(height: 20,),
             SingleChildScrollView(
               child: SizedBox(
                 height: MediaQuery.of(context).size.height*0.8,
                 child: Align(
                     alignment:Alignment.center,child: TextWidget(context: context, text:"Here question paper view")),
               ),
             ),
           ],
         ),
       ),
   );
  }

  onBackPressed(BuildContext context)
  {
    Navigator.of(context).pop();
  }

}