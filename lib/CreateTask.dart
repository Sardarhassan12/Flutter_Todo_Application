import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/TodoApp.dart';

class Createtask extends StatefulWidget {
  const Createtask({super.key});

  @override
  State<Createtask> createState() => _CreatetaskState();
}

class _CreatetaskState extends State<Createtask> {

  var _formKey = GlobalKey<FormState>();
  late String _task;
  List<String> taskList = [];
  List<String> dateList = [];
  List<String> timeList = [];

  //Selecting Date and Time
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  void _selectDate() async{
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate:  DateTime.now(),
        lastDate: DateTime(2101)
    );

    if(selectedDate != null){
      String formattedDate = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      setState(() {
        _dateController.text = formattedDate;
      });
    }

  }

  void _selectTime() async{
    var selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    );
    if(selectedTime != null){
      String formattedTime = selectedTime.format(context);
      setState(() {
        _timeController.text = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //
    // TaskData _allTasks;
    // HoldData _holdData;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TodoApp()))
        }, icon: Icon(Icons.arrow_back), color: Colors.white,),
        title: Text("To Do App", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25,),),
        centerTitle: true,
        backgroundColor:  Color(0xFF1C1B33),
        
      ),
      body: SafeArea(
        child: Center(
            child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1C1B33), // Dark purple shade
                  Color(0xFF3E0E56),
                  Color(0xFF1C1B33)// Deep violet shade
                ],
              ),
            ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 250.0,
                  left: 20.0,
                  right: 20.0,
                  bottom: 20.0,
              ),
                child: Form(
                  key: _formKey,
                    child:Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:  Color(0xFF6246E3), width: 2), // Normal state
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:  Color(0xFF6246E3), width: 2), // When focused
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 2), // On error
                            ),
                            hintText: "Enter Task",
                            labelText: "Task",
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Please Enter Task";
                            }
                            else{
                              _task = value;
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _dateController,
                                keyboardType: TextInputType.datetime,
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                                decoration: InputDecoration(
                                  labelText: "Date",
                                  border: OutlineInputBorder(),
                                ),
                                readOnly: true,
                                onTap: (){
                                  _selectDate();
                                },
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            Expanded(
                                child: TextFormField(
                                  controller: _timeController,
                                  keyboardType: TextInputType.datetime,
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                                  decoration: InputDecoration(
                                    labelText: "Time",
                                    border: OutlineInputBorder(),
                                  ),
                                  readOnly: true,
                                  onTap: (){
                                    _selectTime();
                                  },
                                )
                            ),
                          ],
                        ),

                        SizedBox(height: 40.0,),
                        ElevatedButton(
                            onPressed: () async{
                              if(_formKey.currentState!.validate()){
                                _formKey.currentState!.save();
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                // Load old tasks first
                                List<String> existingTasks = prefs.getStringList("tasks") ?? [];
                                List<String> existingDates = prefs.getStringList("dates") ?? [];
                                List<String> existingTimes = prefs.getStringList("times") ?? [];

                                // Add the new task
                                existingTasks.add(_task);
                                existingDates.add(_dateController.text.isNotEmpty ? _dateController.text : "No Date");
                                existingTimes.add(_timeController.text.isNotEmpty ? _timeController.text : "No Time");

                                // Save updated lists
                                prefs.setStringList("tasks", existingTasks);
                                prefs.setStringList("dates", existingDates);
                                prefs.setStringList("times", existingTimes);


                                // _allTasks = TaskData(
                                //     _task,
                                //     _dateController.text.isNotEmpty ? _dateController.text : "No Date",
                                //     _timeController.text.isNotEmpty ? _timeController.text : "No Time"
                                // ),
                                // _holdData = HoldData(),
                                // _holdData.addTaskData(_allTasks),
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>TodoApp()));
                              }
                            },

                            child: Text("Add Task",style:TextStyle(fontSize: 18)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:  Color(0xFF6246E3),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 145),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                          )
                        )
                      ],
                    )
                ),
              ),
            )
        )
      ),
      );
  }
}

// class TaskData{
//   String? task;
//   String? date;
//   String? time;
//
//   TaskData(this.task, this.date, this.time);
// }
//
// class HoldData{
//   List<TaskData> taskData = [];
//
//   void addTaskData(TaskData task) async{
//     SharedPreferences prefs =await SharedPreferences.getInstance();
//     this.taskData.add(task);
//
//     List<String> jsonTaskList = taskData.map((t)=> jsonEncode({
//       "task" : t.task,
//       "date" : t.date,
//       "time" : t.time
//     })).toList();
//
//     prefs.setStringList("taskData", jsonTaskList);
//   }
//
//   Future<List<TaskData>> loadData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String>? jsonTaskList = prefs.getStringList("taskData");
//
//     if (jsonTaskList == null) return []; // Handle null safely
//
//     return jsonTaskList.map((taskJson) {
//       Map<String, dynamic> map = jsonDecode(taskJson);
//       return TaskData(
//         map["task"] as String?,
//         map["date"] as String?,
//         map["time"] as String?,
//       );
//     }).toList();
//   }
// }
