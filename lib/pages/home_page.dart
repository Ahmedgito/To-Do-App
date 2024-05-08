import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app_ahmed/data/database.dart';
import 'package:to_do_app_ahmed/utilitites/to-do.dart';
import 'package:to_do_app_ahmed/utils/dialog_box.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => Home_pageState();
}
 
class Home_pageState extends State<Home_page> {
  final _myBox = Hive.box('mybox');

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else { 
      db.loadData();
    }
    super.initState();
  }

  //Text Editing Controller
  final _controller = TextEditingController();

  ToDoDatabase db = ToDoDatabase();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.ToDoList[index][1] = !db.ToDoList[index][1];
    });
    db.updateDatabase();
  }

  void savenewTask() {
    setState(() {
      db.ToDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: savenewTask,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.ToDoList.removeAt(index);
    });
    db.updateDatabase();
  }

 

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
        title: Text('To Do App', style: TextStyle(color: Colors.brown[900])),
        backgroundColor: Colors.brown[400],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown[400],
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: db.ToDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.ToDoList[index][0],
              taskCompleted: db.ToDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
          );
        },
        ),
      ),
    );
  } 
}
