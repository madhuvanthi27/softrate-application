import 'package:flutter/material.dart';

class Brief extends StatelessWidget {

  String taskName;
  int taskId;
  String taskSubject;

  Brief({this.taskId,this.taskName,this.taskSubject});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 6, 8),
      child: GestureDetector(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[600],
              width: 0.9,
            ),
            borderRadius: BorderRadius.circular(6.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    taskName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                    taskSubject,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                ),
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
