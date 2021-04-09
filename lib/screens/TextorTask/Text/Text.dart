import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:softrate/screens/TextorTask/Text/Messages/Messages.dart';
import 'package:softrate/screens/TextorTask/Text/Messages/Name.dart';
import 'package:softrate/services/Storage.dart';


class TEXT extends StatefulWidget {
  String currentGroupName;
  /*
  List<Messages> MessageList=[
    Messages(text: 'Heyy',sender: 'Ganesh',bg: Colors.deepPurple),
    Messages(text: 'Heyyyyy',sender: 'Avinash',bg: Colors.red),
    Messages(text: 'Hey',sender: 'Santhosh',bg: Colors.indigo),
    Messages(text: 'Hi !',sender: 'Swathika',bg: Colors.amber),
    Messages(text: 'Hey !',sender: 'Madhu',bg: Colors.teal),
    Messages(text: 'About our project are we gonna complete it?',sender: 'Ganesh',bg: Colors.deepPurple),
    Messages(text: 'Coz you know.. We crossed our deadline :|',sender: 'Ganesh',bg: Colors.deepPurple),
    Messages(text: 'If you guys have any updates.. let me know',sender: 'Ganesh',bg: Colors.deepPurple),
    Messages(text: 'I have almost finished the UI..' ,sender: 'Avinash',bg: Colors.red),
    Messages(text: 'But Im still not sure if you guys could do it in a week Chat app backend seems complex',sender: 'Avinash',bg: Colors.red),
    Messages(text: 'Athellam paniralam da',sender: 'Santhosh',bg: Colors.indigo),
    Messages(text: 'One day tha agum',sender: 'Santhosh',bg: Colors.indigo),
    Messages(text: 'Mark as read',sender: 'Swathika',bg: Colors.amber),
  ];*/
  TEXT({this.currentGroupName});

  @override
  _TEXTState createState() => _TEXTState();
}

class _TEXTState extends State<TEXT> {

  storage details = storage();
  List<dynamic> messageData;
  List<Messages> MessageList=[];

  @override
  Widget build(BuildContext context) {

    print(widget.currentGroupName);
    MessageList.clear();
    messageData = details.Groups[widget.currentGroupName]['messages'];

    for(int i=0;i<messageData.length;i++)
    {
      MessageList.add(Messages(sender: messageData[i]['sender'],text: messageData[i]['text'],bg: messageData[i]['bg']));
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: MessageList.length,
              itemBuilder: (BuildContext context,int index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Name(
                      CurrentSenderName: MessageList[index].sender,
                      PreviousSenderName: (index-1>=0)? MessageList[index-1].sender: '0',
                      bg: MessageList[index].bg
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 8.0, 8.0, 20.0),
                      child: Text(
                        MessageList[index].text,
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                );
                }
              ),
            ),
        Container(
          padding: EdgeInsets.symmetric(horizontal:8),
          height: 70,
          color: Colors.black26,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.photo),
                color: Colors.grey[300],
                onPressed: (){},
              ),
              Expanded(
                child: TextField(
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Send a Message...',
                    hintStyle: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
              IconButton(
                icon: Icon(Icons.send_sharp),
                color: Colors.grey[300],
                onPressed: (){},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
