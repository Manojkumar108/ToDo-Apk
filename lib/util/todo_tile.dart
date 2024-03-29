
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
   
   ToDoTile({ Key? key,required this.taskName,
    required this.taskCompleted,
    required this.onChanged, 
    required this.deleteFunction,

    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 25,),
      child: Slidable(
        //29:19 slidable widget
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [ 
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade400,
            borderRadius: BorderRadius.circular(12),

            )
           ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              //task name
              Checkbox(value: taskCompleted, onChanged: onChanged,
              activeColor: Colors.black,),

              Text(taskName,
             style: TextStyle(decoration:taskCompleted ? TextDecoration.lineThrough :TextDecoration.none),),
            ],
          ),
          decoration: BoxDecoration(color: Colors.amber[200],
          borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}