import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class MyDatePicker extends StatefulWidget {
  final String label;
  final Function onSelectDate;
  MyDatePicker(this.label,this.onSelectDate);
  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  var currentDate = DateTime.now();
  
  final TextEditingController _controller = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2005),
      lastDate: currentDate);
  if (pickedDate != null)
  {
    setState(() {
      _controller.text = DateFormat('dd-MM-yyyy').format(pickedDate).toString();
    });
    widget.onSelectDate(pickedDate);
  }
}


  String labelString='';
  @override
    void initState() {
      labelString = widget.label;
      super.initState();
    }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            flex: 9,
            child: Container(
              width: 600.0,
              
              child: InkWell(
                child: TextField(
                  onTap: () async{
                  await _selectDate(context);
                },
                  readOnly: true,
                  controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor)),
                      labelText: labelString,
                      
                    ),
                  ),
              ),
              ),
            ),
          Flexible(
            flex: 1,
            child: Text(
              ' *',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}