import 'package:flutter/material.dart';

class Name extends StatelessWidget {

  String CurrentSenderName;
  String PreviousSenderName;
  MaterialColor bg;

  Name({this.CurrentSenderName,this.PreviousSenderName,this.bg});

  @override
  Widget build(BuildContext context) {
    if (PreviousSenderName=='0' || PreviousSenderName!=CurrentSenderName) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundColor: bg,
                radius: 17.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                CurrentSenderName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      );
    }
    else
      {
        return SizedBox(height: 0);
      }
  }
}
