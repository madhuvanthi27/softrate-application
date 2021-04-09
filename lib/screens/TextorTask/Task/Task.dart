import 'package:flutter/material.dart';
import 'package:softrate/screens/TextorTask/Task/Tasks/BriefTask.dart';
import 'package:softrate/screens/TextorTask/Task/Tasks/TaskDetails.dart';
import 'package:softrate/services/Storage.dart';

class Task extends StatefulWidget {
  String currentGroupName;

  Task({this.currentGroupName});

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {

  List <Widget> TasksLeft =[];
  List <Widget> TasksRight =[];

  storage data = storage();

  List<dynamic> Tasksdata;
  List<TaskDetails> TaskList=[];

  void addTasks()
  {
    //Do not Touch

    TaskList.clear();
    Tasksdata = data.Groups[widget.currentGroupName]['tasks'];

    for(int i=0;i<Tasksdata.length;i++)
    {
      TaskList.add(TaskDetails(taskId: Tasksdata[i]['taskId'],taskName: Tasksdata[i]['taskName'],taskSubject: Tasksdata[i]['taskSubject'],taskDescription: Tasksdata[i]['taskDescription']));
    }
  }
  void splitTasks()
  {
    //Do not Touch

    TasksLeft.clear();
    TasksRight.clear();

    for(int i=0;i<TaskList.length;i++)
    {
      Brief briefTask = Brief(taskId: TaskList[i].taskId,taskName: TaskList[i].taskName,taskSubject: TaskList[i].taskSubject);
      if(i%2==0)
        TasksLeft.add(briefTask);
      else
        TasksRight.add(briefTask);
    }
  }


  @override
  Widget build(BuildContext context) {

    addTasks(); // Function to add tasks in the Tasklist.

    splitTasks(); // Function to split tasks in left and right side.

    return ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex:1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: TasksLeft,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: TasksRight,
                        ),
                      )
                    ],
                  ),
                )
              ],
        );
  }
}
