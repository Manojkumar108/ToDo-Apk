import 'package:flutter/material.dart';
import 'package:myapp/util/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancle;

   DialogBox ({ Key? key,required this.controller,required this.onSave,required this.onCancle }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.redAccent[200],
      content:SizedBox(height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //get user input
        TextField(
          controller: controller,
          decoration:const InputDecoration(border: OutlineInputBorder(),
          hintText: "Add a New task",
          ) ,
        ),
        Row(
          //alignment property
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //alinghment
            
            MyButton(text: "Save", onPressed: onSave),
            const SizedBox(width: 8,),
            MyButton(text: "Cancel", onPressed: onCancle)
          ],

        ),
      ],),
      ) ,
    );
  }
}