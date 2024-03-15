import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  
List toDoList = [];
  //reference our box
  final _myBox = Hive.box('mybox');

  //first time opning the app
  void createInitialData(){
    toDoList=[
      ['Do DSA',false],
      ["mini project",false]
    ];

  }

  //load the data fromm data base
  void loadData(){
    toDoList = _myBox.get("TODOLIST");

  }


  //update database
  void updateDataBase(){
    _myBox.put("TODOLIST",toDoList);
  }

}