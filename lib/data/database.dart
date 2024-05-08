import 'package:hive/hive.dart';

class ToDoDatabase {
  List ToDoList = [] ;

  final _myBox = Hive.box('mybox') ; 

  void createInitialData (){
    ToDoList = [
      ["Created by M.Ahmed" , false] ,
      ["Make your first Note" , false] ,
    ];
  }

  void loadData(){
    ToDoList = _myBox.get("TODOLIST") ;
  }

  void updateDatabase(){
    _myBox.put("TODOLIST" , ToDoList) ;
  }

} 