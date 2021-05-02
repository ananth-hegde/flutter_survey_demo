import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  final String label;
  final Function onSwitch;
  MySwitch(this.label,this.onSwitch);
  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool _value=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 5,
                child: Text(widget.label),
              ),
              Expanded(
                  flex: 1,
                  child: Switch(
                    activeTrackColor: Colors.greenAccent,
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.blueGrey,
                    inactiveTrackColor: Colors.grey,
                    value: _value,
                    onChanged: (value){
                      setState((){
                        _value = value;
                      });
                      widget.onSwitch(value);
                    },
                  )
              ),
            ]));
  }
}