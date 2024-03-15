

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/data/database.dart';
import 'package:myapp/util/dilog_box.dart';
import '../util/todo_tile.dart';
class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  
  @override
  State<HomePage> createState()=> _HomePageState();
}
  class _HomePageState extends State<HomePage>{
    //reference the hive box
    final _myBox =Hive.box('mybox');
    ToDoDataBase db = ToDoDataBase();

    @override
  void initState() {
    

    //if this first time opning the app
    if (_myBox.get("TODOLIST")==null) {
      db.createInitialData();
    } else {
      //there is already data exists
      db.loadData();

    }

    super.initState();
  }

    //text controller
    final _controller= TextEditingController();

//list of todos
   
//chekBox was Tapped
    void checkBoxChanged(bool? value,int index){
      setState(() {
        db.toDoList[index][1]=!db.toDoList[index][1];
      });
      db.updateDataBase();
    }
    //save New Task
    void saveNewTask() {
  String taskName = _controller.text; // Extract the task name from the text controller
  // Check if the task name is empty or only contains whitespace
  if (taskName.trim().isNotEmpty) {
    setState(() {
      db.toDoList.add([taskName, false]);
    });
    _controller.clear(); // Clear the text controller
    Navigator.of(context).pop(); // Close the dialog
    db.updateDataBase();
  } else {
    // Show a snackbar or toast message indicating that the task name cannot be empty
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter a non-empty task name.'),
      ),
    );
  }
}




    //create task
    void createNewTask(){
      showDialog(context: context, builder:(context){
        return DialogBox(
          controller:_controller ,
          onSave: saveNewTask,
          onCancle: ()=>Navigator.of(context).pop(),
        );

      }, );
      db.updateDataBase();
    }

    //delete task
    void deleteTask(int index){
      setState(() {
        db.toDoList.removeAt(index);
      });
      db.updateDataBase();

    }


    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Colors.teal[200],
        appBar: AppBar(
          title: const Text('TO-DO by Manoj'),
          
          centerTitle:true,
          elevation:0,
        ),
        floatingActionButton:FloatingActionButton(
          onPressed:createNewTask,
          child: const Icon(Icons.add),
          
         ) ,
        body: ListView.builder(
          itemCount:db.toDoList.length ,
          itemBuilder: (context, index) {
            return ToDoTile(taskName: db.toDoList[index][0], taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value,index),
            deleteFunction: (context)=>deleteTask(index),);
          },

          
        ),
      );
    }
  }




